# ORION

ORION is an installable, desktop-inspired web app designed to work on Windows, Android, and iPhone.

## Current features

- Responsive desktop workspace with a dock, shortcuts, and app windows
- Home screen and web-search launcher
- Browser launcher that opens external sites in a new tab
- Files list for tracking names and links (local browser storage)
- Notes with automatic local saving
- Calculator with local expression parsing
- Light/dark appearance and accent color settings
- PWA manifest and service worker for an installable app shell
- Mobile layout and reduced-motion support

## Run locally

Open `index.html` in a modern browser. PWA installation and offline caching require HTTPS or localhost.

## Publish with GitHub Pages

1. Open the repository's **Settings**.
2. Open **Pages**.
3. Under **Build and deployment**, choose **GitHub Actions**.
4. Push a change to `main` or manually run the **ORION quality check and Pages deploy** workflow.
5. When deployment completes, open the Pages URL shown in the workflow.

The workflow checks the app's inline JavaScript, service worker, manifest, and icon before deployment. If Pages is not enabled, validation still passes and the workflow explains the one-time repository setting required.

## Install

- **Windows:** Open the deployed site in Edge or Chrome and choose Install this site as an app.
- **Android:** Open the site in Chrome and choose Install app / Add to Home screen from the browser menu.
- **iPhone:** Open the site in Safari, tap Share, then Add to Home Screen.

Browser wording varies by version.

## Important limitations

ORION runs inside a browser; it is not a replacement operating system. The Files area stores a list inside this app and does not browse your device's folders. Browser shortcuts open websites in new tabs. Native device integrations and native app-store packages would require separate platform-specific work.

## Project files

- `index.html` — interface and application logic
- `manifest.webmanifest` — installation metadata
- `sw.js` — offline app-shell cache
- `icon.svg` — app icon
- `.github/workflows/deploy-pages.yml` — validation and deployment
