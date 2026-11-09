#!/usr/bin/env bash
set -Eeuo pipefail
if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root: sudo $0"
  exit 1
fi
install -d -m 0755 /etc/orion
printf '%s\n' "ORION OS 1.0" "Based on Debian 13 (Trixie)" > /etc/orion/version
systemctl enable NetworkManager.service
systemctl enable bluetooth.service 2>/dev/null || true
systemctl enable lightdm.service 2>/dev/null || true
