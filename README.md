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
olliecode
```

## Shortcut (alias command)

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka CLI olliEcode (data terisolasi ke `~/.ollie`, aman dari OpenCode asli) |

> Alias ini otomatis dibuat oleh installer di `~/.bashrc`.

## Install command satu-liner

| Perintah | Fungsi |
|---|---|
| `curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/setup-ollie.sh \| bash` | Install olliEcode + buat shortcut `olliecode` |
| `curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh \| bash` | Hapus semua jejak olliEcode |

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh | bash
```

## Catatan

- Data olliEcode disimpan terpisah di `~/.ollie` (bukan `~/.config/opencode`), jadi **OpenCode asli tidak tersentuh**.
- **Bun** tidak ikut terhapus saat uninstall (dipakai app lain).
- Repo sumber: `https://gitlab.com/123-group5802346/olliecode`
