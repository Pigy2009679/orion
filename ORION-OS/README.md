# ORION OS

ORION OS is a Debian 13 (Trixie) live Linux distribution project using the real
Linux kernel, XFCE desktop, APT package management, and Chromium.

## What this project builds

- A bootable x86_64 live ISO using Debian live-build
- XFCE desktop with ORION wallpaper and branding
- Chromium with ORION browser policies and a custom start page
- Network, Bluetooth, sound, file, terminal, and system settings utilities
- A GitHub Actions workflow that builds the ISO and saves it as an artifact

This is a real Debian-based Linux image, not a website or a desktop mockup.
It is an initial foundation: it customizes existing Linux components rather
than claiming to contain a separately written browser or settings application.

## Build with GitHub Actions

1. Upload the contents of this folder to a new GitHub repository.
2. Open the repository's **Actions** tab.
3. Select **Build ORION OS**.
4. Click **Run workflow** (or push a change to the main branch).
5. When the run finishes, open its summary and download the
   `orion-os-amd64-iso` artifact.

The artifact contains `orion-os-amd64.iso`.

## Build locally

Use a Debian or Ubuntu x86_64 computer with administrator access and an
internet connection. Building an ISO needs several gigabytes of free disk space.

Install dependencies:

```bash
sudo apt-get update
sudo apt-get install -y live-build debootstrap xorriso squashfs-tools \
  syslinux syslinux-utils dosfstools mtools ca-certificates curl
```

Build:

```bash
chmod +x build.sh
./build.sh
```

The ISO is written to `output/orion-os-amd64.iso`.

## Test the ISO

Use a virtual machine such as QEMU, VirtualBox, VMware, or Hyper-V. Create a
new Linux virtual machine, attach the ISO as its virtual DVD, and boot it.
Do not overwrite your computer's existing operating system when testing.

## Project structure

- `.github/workflows/build.yml` — automated ISO build
- `live-build/config/` — Debian live-build configuration
- `live-build/config/package-lists/` — packages installed in the image
- `live-build/config/includes.chroot/` — files copied into the Linux image
- `live-build/config/hooks/live/` — configuration applied during image creation
- `scripts/` — configuration scripts used by the build hook
- `branding/` — ORION logo and wallpaper source files
- `build.sh` — local build command

## Notes

- The build downloads packages from Debian repositories, so internet access is
  required during the build.
- GitHub Actions builds the ISO; uploading this ZIP alone does not build it.
- A successful workflow run is required before an ISO exists.
- The ISO is for x86_64/amd64 PCs and virtual machines.
