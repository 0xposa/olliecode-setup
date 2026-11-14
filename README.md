# olliEcode Setup

Install **olliEcode** (binary siap pakai) — Windows, Linux, macOS.

## Instalasi (Linux / proot-distro / Android)

```bash
proot-distro login ubuntu
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/setup-ollie.sh | bash
source ~/.bashrc
olliecode
```

Installer auto-deteksi `arm64` / `x64`.

## Instalasi (Windows / macOS)

Download binary sesuai OS dari **[Releases](https://github.com/0xposa/olliecode-setup/releases/latest)**:

| OS | File |
|---|---|
| Linux ARM64 (HP Android/proot) | `opencode-linux-arm64.gz` |
| Linux x64 | `opencode-linux-x64.gz` |
| Linux x64 (musl/Alpine) | `opencode-linux-x64-musl.gz` |
| macOS Apple Silicon (M1/M2/M3) | `opencode-darwin-arm64.gz` |
| macOS Intel | `opencode-darwin-x64.gz` |
| Windows x64 | `opencode-windows-x64.gz` |
| Windows ARM | `opencode-windows-arm64.gz` |

Cara pakai:

```bash
# Linux/macOS: ekstrak, kasih izin jalan, jalankan
gzip -d opencode-<os>.gz
chmod +x opencode-<os>
./opencode-<os>
```

Windows: ekstrak `.gz` (pakai 7-Zip), lalu jalankan `opencode.exe`.

## Shortcut (Linux)

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka CLI olliEcode |
| `olliecode-web` | Web UI di `http://localhost:4444` |
| `olliecode-reset` | Hapus data (`~/.ollie`) |

## Uninstall (Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/uninstall-ollie.sh | bash
```

## Catatan

- Data terisolasi di `~/.ollie` — OpenCode asli tidak tersentuh.
- Repo sumber: `https://gitlab.com/123-group5802346/olliecode`