# ORION OS

ORION OS is a Debian 13 (Trixie) live Linux distribution project.

The Linux project files are in the **ORION-OS/** folder. The GitHub Actions
workflow is stored at the repository root in **.github/workflows/** so GitHub
can detect and run it.

## Build the ISO

1. Open the **Actions** tab.
2. Select **Build ORION OS**.
3. Choose **Run workflow** and confirm.
4. Wait for the build to finish.
5. Open the completed run and download the **orion-os-amd64-iso** artifact.

The artifact contains `orion-os-amd64.iso`.

## What it includes

- Debian 13 (Trixie) base and the real Linux kernel
- XFCE desktop environment
- Chromium browser with ORION policies and a custom start page
- Network, Bluetooth, audio, file manager, terminal, and system utilities
- ORION wallpaper, logo, and desktop branding

This is an initial Debian-based OS foundation. It customizes existing Linux
components; it is not yet a fully independent desktop environment or browser.

See [ORION-OS/README.md](ORION-OS/README.md) for project details and local build
instructions.
