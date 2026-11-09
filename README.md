# ORION

ORION is a cross-platform, installable desktop-style web app designed for Windows, Android, and iPhone.

## Try it

Open the repository's GitHub Pages site after Pages deployment is enabled. You can also run it locally by opening `index.html` in a browser. For full install/offline support, serve it over HTTPS (GitHub Pages does this automatically).

## Current features

- Responsive desktop layout for computers and touch-first mobile layout
- Home screen, dock, app windows, minimize, maximize, and close
- ORION Browser launcher with web search and site shortcuts (external pages open in a new tab)
- Files list stored locally in the browser
- Notes with automatic local saving
- Calculator
- Light/dark appearance and accent color settings
- PWA manifest and service worker for installability and offline app shell

## Install

- **Windows:** Open the deployed site in Edge or Chrome and choose Install this site as an app.
- **Android:** Open the site in Chrome, open the browser menu, and choose Install app / Add to Home screen.
- **iPhone:** Open the site in Safari, tap Share, then Add to Home Screen.

Exact labels vary by browser and OS version.

## Important limitations

ORION is an app running inside the browser, not a replacement operating system. Its Files app stores app-created entries locally; it does not browse the phone or PC file system. The Browser app launches external websites in new tabs rather than embedding every site. Native device integrations, true multi-window OS controls, push notifications, and app-store packaging are future work.

## Project structure

- `index.html` — application UI and interactions
- `manifest.webmanifest` — install metadata
- `sw.js` — offline application shell
- `icon.svg` — app icon
- `.github/workflows/deploy-pages.yml` — GitHub Pages deployment
