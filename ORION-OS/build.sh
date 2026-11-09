#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIVE_DIR="${ROOT_DIR}/live-build"
OUTPUT_DIR="${ROOT_DIR}/output"
LOG_FILE="${OUTPUT_DIR}/build.log"

mkdir -p "${OUTPUT_DIR}"

if ! command -v lb >/dev/null 2>&1; then
  echo "[ERROR] live-build is missing."
  echo "Install dependencies listed in README.md, then run this script again."
  exit 1
fi

for tool in debootstrap xorriso mksquashfs; do
  if ! command -v "${tool}" >/dev/null 2>&1; then
    echo "[ERROR] Required build tool is missing: ${tool}"
    exit 1
  fi
done

cd "${LIVE_DIR}"
echo "[ORION] Cleaning previous build..."
lb clean --purge || true

echo "[ORION] Configuring Debian 13 (Trixie) live image..."
lb config \
  --mode debian \
  --distribution trixie \
  --architectures amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --debian-installer live \
  --linux-flavours amd64 \
  --bootappend-live "boot=live components quiet splash locales=en_US.UTF-8 keyboard-layouts=us" \
  --iso-application "ORION OS" \
  --iso-publisher "ORION OS Project" \
  --iso-volume "ORION_OS" \
  --apt-recommends true

echo "[ORION] Building ISO. This can take a while..."
set +e
lb build 2>&1 | tee "${LOG_FILE}"
build_status=${PIPESTATUS[0]}
set -e
if [[ "${build_status}" -ne 0 ]]; then
  echo "[ERROR] live-build failed. See ${LOG_FILE}"
  exit "${build_status}"
fi

iso_file="$(find . -maxdepth 1 -type f \\( -name '*.hybrid.iso' -o -name '*.iso' \\) -print -quit)"
if [[ -z "${iso_file}" ]]; then
  echo "[ERROR] Build finished but no ISO was found."
  exit 1
fi

cp "${iso_file}" "${OUTPUT_DIR}/orion-os-amd64.iso"
echo "[SUCCESS] Created ${OUTPUT_DIR}/orion-os-amd64.iso"
