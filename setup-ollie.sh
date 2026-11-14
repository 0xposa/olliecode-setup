#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode setup — jalankan sebagai root di proot-distro
# (Ubuntu / Debian). Membuat shortcut-shortcut yang isolasi
# data dari opencode asli.
# ============================================================

echo "== 1/5 Install paket dasar =="
apt update && apt install -y git curl unzip

echo "== 2/5 Install Bun =="
export PATH="$HOME/.bun/bin:$PATH"
if ! command -v bun >/dev/null 2>&1; then
  curl -fsSL https://bun.sh/install | bash
fi
export PATH="$HOME/.bun/bin:$PATH"
echo "Bun: $(bun -v)"

echo "== 3/5 Clone repo =="
cd "$HOME"
if [ ! -d olliecode/.git ]; then
  git clone https://gitlab.com/123-group5802346/olliecode.git
fi
cd olliecode

echo "== 4/5 Install dependensi =="
bun install

echo "== 5/5 Pasang shortcut =="
if ! grep -q 'alias olliecode=' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" << 'EOF'

# ---- olliEcode shortcuts (isolasi data, aman dari opencode asli) ----
alias olliecode='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; cd "$HOME/olliecode"; bun run --cwd packages/cli src/index.ts'
alias olliecode-web='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; cd "$HOME/olliecode"; bun dev serve --port 4096 & cd packages/app; bun dev -- --port 4444'
alias olliecode-update='cd "$HOME/olliecode"; git pull; bun install'
alias olliecode-reset='rm -rf "$HOME/.ollie"; echo "Data olliEcode direset"'
EOF
fi

echo ""
echo "SELESAI."
echo "Jalankan:  source ~/.bashrc"
echo ""
echo "Shortcut yang tersedia:"
echo "  olliecode         -> buka CLI"
echo "  olliecode-web     -> web UI di http://localhost:4444"
echo "  olliecode-update  -> git pull + reinstall"
echo "  olliecode-reset   -> hapus data (~/.ollie)"
