# olliEcode Setup

One-line install & uninstall untuk **olliEcode** di proot-distro (Ubuntu/Debian).

## Prasyarat

- **Termux** (dari F-Droid/GitHub, bukan Play Store)
- `proot-distro` terinstall dan distro **Ubuntu** (atau Debian) sudah ada:
  ```bash
  pkg install proot-distro
  proot-distro install ubuntu
  ```

## Install

Masuk ke distro dulu:

```bash
proot-distro login ubuntu
```

Lalu paste satu baris:

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/setup-ollie.sh | bash
```

## Pakai

```bash
source ~/.bashrc
```

## Shortcut (alias command)

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka CLI olliEcode (data terisolasi ke `~/.ollie`) |
| `olliecode-web` | Jalanin web UI di `http://localhost:4444` |
| `olliecode-update` | `git pull` + `bun install` (update) |
| `olliecode-reset` | Hapus data olliEcode (`~/.ollie`) |

Isi alias yang dibuat installer di `~/.bashrc`:

```bash
alias olliecode='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; cd "$HOME/olliecode"; bun run --cwd packages/cli src/index.ts'

alias olliecode-web='export XDG_CONFIG_HOME="$HOME/.ollie/config"; export XDG_DATA_HOME="$HOME/.ollie/data"; export XDG_CACHE_HOME="$HOME/.ollie/cache"; export XDG_STATE_HOME="$HOME/.ollie/state"; cd "$HOME/olliecode"; bun dev serve --port 4096 & cd packages/app; bun dev -- --port 4444'

alias olliecode-update='cd "$HOME/olliecode"; git pull; bun install'

alias olliecode-reset='rm -rf "$HOME/.ollie"; echo "Data olliEcode direset"'
```

> Alias ini otomatis dibuat oleh installer di `~/.bashrc`. Data terisolasi, jadi **OpenCode asli tidak tersentuh**.

## One-liner install / uninstall

| Perintah | Fungsi |
|---|---|
| `curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/setup-ollie.sh \| bash` | Install + bikin semua shortcut |
| `curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh \| bash` | Hapus semua jejak olliEcode |

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh | bash
```

## Catatan

- Data olliEcode disimpan terpisah di `~/.ollie` (bukan `~/.config/opencode`), jadi **OpenCode asli tidak tersentuh**.
- **Bun** tidak ikut terhapus saat uninstall (dipakai app lain).
- Repo sumber: `https://gitlab.com/123-group5802346/olliecode`
