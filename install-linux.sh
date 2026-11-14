#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode — installer Linux (simple)
# ============================================================

REPO="https://github.com/0xposa/olliecode-setup"

case "$(uname -m)" in
  aarch64|arm64) ASSET="opencode-linux-arm64.gz" ;;
  x86_64|amd64)  ASSET="opencode-linux-x64.gz" ;;
  *) echo "Arsitektur tidak didukung: $(uname -m)"; exit 1 ;;
esac

echo "Download $ASSET ..."
TMP="$(mktemp -d)"
curl -fL --retry 3 -o "$TMP/opencode.gz" "$REPO/releases/latest/download/$ASSET"
gzip -dc "$TMP/opencode.gz" > "$TMP/opencode"
chmod +x "$TMP/opencode"

# Taruh di PATH yang sudah aktif -> langsung bisa dipakai tanpa source
if [ -w /usr/local/bin ]; then
  DEST="/usr/local/bin/olliecode"
else
  DEST="$HOME/.local/bin/olliecode"
  mkdir -p "$HOME/.local/bin"
fi
mv "$TMP/opencode" "$DEST"
rm -rf "$TMP"

echo ""
echo "SELESAI. Langsung ketik:"
echo "  olliecode"
