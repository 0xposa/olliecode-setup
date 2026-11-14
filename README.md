# olliEcode Setup

Installer **binary siap pakai** untuk **olliEcode** di proot-distro (Ubuntu/Debian) — **arm64 (aarch64)**. Tanpa build.

## Prasyarat

- **Termux** (F-Droid/GitHub, bukan Play Store)
- `proot-distro` + distro **Ubuntu/Debian arm64**:
  ```bash
  pkg install proot-distro
  proot-distro install ubuntu
  ```

## Cara pakai (langkah demi langkah)

### 1. Buka Termux

### 2. Masuk ke Ubuntu proot

```bash
proot-distro login ubuntu
```

(Prompt langsung `root@localhost`)

### 3. Paste installer (satu baris)

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/setup-ollie.sh | bash
```

Tunggu sampai keluar `SELESAI.` — ini download binary ~98MB, butuh beberapa menit tergantung internet.

### 4. Aktifkan shortcut

```bash
source ~/.bashrc
```

### 5. Jalankan

```bash
olliecode
```

## Web UI (browser HP)

```bash
olliecode-web
```

Lalu buka di browser Android: `http://localhost:4444`

## Reset / hapus data

```bash
olliecode-reset
```

## Shortcut (alias command)

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka CLI olliEcode |
| `olliecode-web` | Jalanin service di `http://localhost:4444` |
| `olliecode-reset` | Hapus data olliEcode (`~/.ollie`) |

Isi alias (ditulis installer ke `~/.bashrc`):

```bash
alias olliecode='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; $HOME/.ollie/bin/opencode'

alias olliecode-web='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; $HOME/.ollie/bin/opencode serve --port 4096'

alias olliecode-reset='rm -rf "$HOME/.ollie"; echo "Data olliEcode direset"'
```

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh | bash
```

## Troubleshooting

| Masalah | Solusi |
|---|---|
| `curl` error / timeout | Cek koneksi internet, coba ulangi perintah install |
| `olliecode: command not found` | Jalankan `source ~/.bashrc` dulu |
| `Cannot execute binary file` | Cek arsitektur: `uname -m` harus `aarch64`. Kalau bukan, binary ini salah CPU |
| OpenCode asli ikut berubah | Tidak mungkin — data olliEcode di `~/.ollie`, terpisah total |

## Catatan

- **Data olliEcode terisolasi** di `~/.ollie` — **OpenCode asli tidak tersentuh**.
- **Binary**: `opencode-linux-arm64.gz` (98MB, di GitHub Releases).
- **Repo sumber**: `https://gitlab.com/123-group5802346/olliecode`
