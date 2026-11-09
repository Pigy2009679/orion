#!/usr/bin/env bash
set -Eeuo pipefail
if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root: sudo $0"
  exit 1
fi
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y task-xfce-desktop xfce4-goodies lightdm chromium \
  network-manager network-manager-gnome bluez blueman pipewire wireplumber \
  thunar xfce4-terminal xfce4-settings pavucontrol curl wget sudo \
  ca-certificates papirus-icon-theme
