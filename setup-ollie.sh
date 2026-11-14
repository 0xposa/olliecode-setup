#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode installer — download binary siap pakai (arm64)
# Tanpa build. Untuk proot-distro Ubuntu/Debian arm64.
# ============================================================

REPO="https://github.com/0xposa/olliecode-setup"
INSTALL_DIR="$HOME/.ollie/bin"
BIN="$INSTALL_DIR/opencode"

echo "== 1/4 Cek arsitektur =="
if [ "$(uname -m)" != "aarch64" ]; then
  echo "ERROR: binary ini untuk arm64 (aarch64). Arsitekturmu: $(uname -m)"
  exit 1
fi

echo "== 2/4 Download binary =="
mkdir -p "$INSTALL_DIR"
curl -fL --retry 3 -o /tmp/opencode.gz \
  "$REPO/releases/latest/download/opencode-linux-arm64.gz"

echo "== 3/4 Ekstrak & pasang =="
gzip -d -f /tmp/opencode.gz
install -m 0755 /tmp/opencode "$BIN"
rm -f /tmp/opencode
echo "Binary terpasang: $BIN"

echo "== 4/4 Pasang shortcut =="
if ! grep -q 'alias olliecode=' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" << 'EOF'

# ---- olliEcode shortcuts (isolasi data, aman dari opencode asli) ----
alias olliecode='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; $HOME/.ollie/bin/opencode'
alias olliecode-web='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; $HOME/.ollie/bin/opencode serve --port 4096'
alias olliecode-reset='rm -rf "$HOME/.ollie"; echo "Data olliEcode direset"'
EOF
fi

echo ""
echo "SELESAI."
echo "Jalankan:  source ~/.bashrc"
echo ""
echo "Shortcut:"
echo "  olliecode         -> buka CLI"
echo "  olliecode-web     -> web UI di http://localhost:4444"
echo "  olliecode-reset   -> hapus data (~/.ollie)"
