# olliEcode

Install olliEcode (AI coding agent, fork OpenCode).

## Linux

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/install-linux.sh | bash
```

Lalu:
```bash
olliecode
```

## macOS

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/install-mac.sh | bash
```

Lalu:
```bash
olliecode
```

## Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/0xposa/olliecode-setup/main/install-windows.ps1 | iex
```

Tutup & buka ulang PowerShell, lalu:
```powershell
olliecode
```

## Web UI (Linux)

```bash
olliecode serve
```

Lalu buka `http://localhost:4096` di browser, dan masukkan **password** yang muncul di terminal.

## Shortcut

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka olliEcode (CLI) |
| `olliecode serve` | Web UI di `http://localhost:4096` |

## Uninstall

Linux / macOS:
```bash
rm -f /usr/local/bin/olliecode ~/.local/bin/olliecode
```

Windows (PowerShell):
```powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\olliecode"
```

## Catatan

- Web UI saat ini hanya ada di binary Linux.
- Repo sumber: `https://gitlab.com/123-group5802346/olliecode`
