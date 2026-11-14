#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode uninstall — hapus semua jejak olliEcode
# (OpenCode asli tidak tersentuh)
# ============================================================

echo "== 1/3 Hapus alias =="
sed -i '/# ---- olliEcode shortcuts/,/alias olliecode-reset=/d' "$HOME/.bashrc" 2>/dev/null || true
sed -i '/alias olliecode/d' "$HOME/.bashrc" 2>/dev/null || true
echo "Alias dihapus"

echo "== 2/3 Hapus binary =="
rm -rf "$HOME/.ollie"
echo "Binary & data dihapus (~/.ollie)"

echo "== 3/3 Selesai =="
echo ""
echo "SELESAI. olliEcode sudah di-uninstall."
echo "OpenCode asli tetap utuh — tidak tersentuh."
echo "Jalankan:  source ~/.bashrc"
