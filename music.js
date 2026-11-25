// Music sites (see manifest.json), in the page's own world, where the site's media session is: tells
// the extension what's playing and takes the sidebar mini player's buttons back (player.js), through
// music-relay.js in the extension's world, which can talk to the extension.

{ // a block, so these names can't clash with the site's own globals
  // Sites give their play/pause/next/previous to navigator.mediaSession for the Mac's media keys;
  // keep a copy so the player's buttons can call them too.
  const handlers = {};
  const setActionHandler = MediaSession.prototype.setActionHandler;
  // With this action a site asks Chrome to pop its own mini player out into a floating window when
  // you switch tabs; on music sites the sidebar player does that job, so it is held back. It is passed
  // on only once music-relay.js says the setting is off (Settings → Player), since the site may set it
  // before the relay's word arrives.
  const PIP = 'enterpictureinpicture';
  // popout: the mini player's pop-out button let the next one through (see 'popout' below).
  let pip = null, stopPopout = true, popout = false;
  const blocked = () => stopPopout && !popout;
  const passPip = () => {
    try { setActionHandler.call(navigator.mediaSession, PIP, blocked() ? null : pip); } catch {} // a browser that doesn't know it
    if (blocked() || !pip) delete handlers[PIP];
    else handlers[PIP] = pip;
  };
  MediaSession.prototype.setActionHandler = function (action, handler) {
    if (action === PIP) { pip = handler; if (!blocked()) passPip(); return; }
    setActionHandler.call(this, action, handler); // throws for an action the browser doesn't know
    handlers[action] = handler;
  };
  addEventListener('message', e => {
    const prefs = e.source === window && e.data?.monochromeMusicPrefs;
    if (!prefs || prefs.stopPopout === stopPopout) return;
    stopPopout = prefs.stopPopout;
    if (pip) passPip();
  });

  // Chrome can also pop a playing video out by itself when its tab is left, without asking the site
  // (chrome://flags/#browser-initiated-automatic-picture-in-picture), so with the setting on the videos
  // are marked as not for picture-in-picture, which Chrome honors, and a pop-out that opens anyway is
  // closed. Only videos marked here are unmarked when the setting goes off.
  // ponytail: this also stops the site's own picture-in-picture button while the setting is on; the mini
  // player's pop-out button is the way out. Marking only while the tab is hidden comes too late for Chrome.
  const marked = new WeakSet();
  const markVideos = () => {
    for (const video of document.querySelectorAll('video')) {
      if (blocked() && !video.disablePictureInPicture) { video.disablePictureInPicture = true; marked.add(video); }
      else if (!blocked() && marked.has(video)) { video.disablePictureInPicture = false; marked.delete(video); }
    }
  };
  addEventListener('enterpictureinpicture', () => {
    if (blocked()) document.exitPictureInPicture().catch(() => {});
    else if (popout) poppedOut = true;
  }, true);
  // The pop-out button: a page may only start picture-in-picture from a click of its own, which the mini
  // player is not, so player.js lets one through here and then shows the tab and leaves it, and Chrome
  // pops the video out as it does for any tab left. Blocked again once that one closes, or after 5s if
  // none opened. Only the pop-out let through counts, and only the latest press's 5s.
  let poppedOut = false, popoutRequest = 0;
  const setPopout = on => { popout = on; passPip(); markVideos(); };
  addEventListener('leavepictureinpicture', () => { if (popout && poppedOut) { poppedOut = false; setPopout(false); } }, true);

  let sent, sentAt = 0;
  setInterval(() => {
    markVideos();
    const m = navigator.mediaSession.metadata;
    // A playing video, which is what Chrome pops out: the mini player offers its pop-out button.
    const video = [...document.querySelectorAll('video')].some(v => !v.paused);
    const now = JSON.stringify(m ? { title: m.title, artist: m.artist, artwork: m.artwork.at(-1)?.src || '', video } : null);
    // Also resend every 10s, so a restarted service worker hears about it again.
    if (now === sent && Date.now() - sentAt < 10_000) return;
    sent = now;
    sentAt = Date.now();
    postMessage({ monochromeMusic: JSON.parse(now) }, location.origin);
  }, 1000);

  addEventListener('message', e => {
    const action = e.source === window && e.data?.monochromeMusicAction;
    if (!action) return;
    if (action === 'popout') {
      const request = ++popoutRequest;
      poppedOut = false;
      setPopout(true);
      return setTimeout(() => { if (request === popoutRequest && popout && !poppedOut) setPopout(false); }, 5000);
    }
    if (handlers[action]) return handlers[action]({ action });
    // No handler from the site: play or pause its audio/video directly.
    const media = [...document.querySelectorAll('audio, video')];
    if (action === 'play') media[0]?.play();
    if (action === 'pause') media.forEach(el => el.pause());
  });
}
