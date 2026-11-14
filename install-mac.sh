#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode — installer macOS (simple)
# ============================================================

REPO="https://github.com/0xposa/olliecode-setup"

case "$(uname -m)" in
  arm64)  ASSET="opencode-darwin-arm64.gz" ;;
  x86_64) ASSET="opencode-darwin-x64.gz" ;;
  *) echo "Arsitektur tidak didukung: $(uname -m)"; exit 1 ;;
esac

echo "Download $ASSET ..."
TMP="$(mktemp -d)"
curl -fL --retry 3 -o "$TMP/opencode.gz" "$REPO/releases/latest/download/$ASSET"
gzip -dc "$TMP/opencode.gz" > "$TMP/opencode"
chmod +x "$TMP/opencode"

if [ -w /usr/local/bin ]; then
  DEST="/usr/local/bin/olliecode"
else
  DEST="$HOME/.local/bin/olliecode"
  mkdir -p "$HOME/.local/bin"
fi
mv "$TMP/opencode" "$DEST"
rm -rf "$TMP"
xattr -d com.apple.quarantine "$DEST" 2>/dev/null || true

echo ""
echo "SELESAI. Langsung ketik:"
echo "  olliecode"
