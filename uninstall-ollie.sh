#!/usr/bin/env bash
set -e

# ============================================================
# olliEcode uninstall — hapus semua jejak olliEcode
# (OpenCode asli tidak tersentuh)
# ============================================================

echo "== 1/4 Hapus alias olliecode =="
sed -i '/alias olliecode=/d' "$HOME/.bashrc" 2>/dev/null || true
echo "Alias dihapus dari .bashrc"

echo "== 2/4 Hapus folder repo =="
rm -rf "$HOME/olliecode"
echo "Repo dihapus"

echo "== 3/4 Hapus data & config =="
rm -rf "$HOME/.ollie"
echo "Data dihapus (~/.ollie)"

echo "== 4/4 (lewati) Bun tidak dihapus (dipakai app lain) =="
echo "  Kalau mau hapus Bun juga: rm -rf ~/.bun"

echo ""
echo "SELESAI. olliEcode sudah di-uninstall."
echo "OpenCode asli tetap utuh — tidak disentuh sama sekali."
echo "Jalankan:  source ~/.bashrc  (untuk refresh alias)"