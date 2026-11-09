#!/usr/bin/env bash
set -Eeuo pipefail
if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root: sudo $0"
  exit 1
fi
install -d -m 0755 /etc/chromium/policies/managed
install -d -m 0755 /usr/share/orion/browser
install -m 0644 "$(dirname "$0")/../config/browser/policies.json" \
  /etc/chromium/policies/managed/orion.json
install -m 0644 "$(dirname "$0")/../config/browser/newtab.html" \
  /usr/share/orion/browser/newtab.html
