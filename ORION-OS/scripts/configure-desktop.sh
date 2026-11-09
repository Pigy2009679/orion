#!/usr/bin/env bash
set -Eeuo pipefail
if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root: sudo $0"
  exit 1
fi
install -d -m 0755 /usr/share/backgrounds/orion
install -m 0644 "$(dirname "$0")/../branding/orion-wallpaper.svg" \
  /usr/share/backgrounds/orion/orion-wallpaper.svg
install -d -m 0755 /etc/skel/Desktop
cat > /etc/skel/Desktop/ORION-Home.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=ORION Home
Comment=Open the home folder
Exec=thunar
Icon=folder-home
Terminal=false
Categories=Utility;FileManager;
EOF
chmod 0644 /etc/skel/Desktop/ORION-Home.desktop
