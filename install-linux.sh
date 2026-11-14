#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode — installer Linux
# ============================================================

REPO="https://github.com/0xposa/olliecode-setup"
BIN_DIR="$HOME/.ollie/bin"
BIN="$BIN_DIR/opencode"

case "$(uname -m)" in
  aarch64|arm64) ASSET="opencode-linux-arm64.gz" ;;
  x86_64|amd64)  ASSET="opencode-linux-x64.gz" ;;
  *) echo "Arsitektur tidak didukung: $(uname -m)"; exit 1 ;;
esac

echo "Download $ASSET ..."
mkdir -p "$BIN_DIR"
curl -fL --retry 3 -o /tmp/opencode.gz "$REPO/releases/latest/download/$ASSET"
gzip -d -f /tmp/opencode.gz
install -m 0755 /tmp/opencode "$BIN"
rm -f /tmp/opencode

RC="$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && RC="$HOME/.zshrc"
if ! grep -q 'alias olliecode=' "$RC" 2>/dev/null; then
  cat >> "$RC" << 'EOF'

# olliEcode
alias olliecode='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; $HOME/.ollie/bin/opencode'
EOF
fi

echo ""
echo "SELESAI. Jalankan:"
echo "  source $RC"
echo "  olliecode"
