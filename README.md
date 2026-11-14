# olliEcode Setup

Install **olliEcode** (binary siap pakai) untuk proot-distro Ubuntu/Debian — arm64.

## Instalasi

```bash
proot-distro login ubuntu
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/setup-ollie.sh | bash
source ~/.bashrc
```

Selesai. Jalankan:

```bash
olliecode
```

## Shortcut

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka CLI olliEcode |
| `olliecode-web` | Web UI di `http://localhost:4444` |
| `olliecode-reset` | Hapus data (`~/.ollie`) |

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh | bash
```

## Catatan

- Data terisolasi di `~/.ollie` — OpenCode asli tidak tersentuh.
- Binary: `opencode-linux-arm64.gz` (GitHub Releases).
- Repo sumber: `https://gitlab.com/123-group5802346/olliecode`
