# olliEcode

Install olliEcode (AI coding agent, fork OpenCode).

## Linux

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/install-linux.sh | bash
```

Lalu:
```bash
source ~/.bashrc
olliecode
```

## macOS

```bash
curl -fsSL https://raw.githubusercontent.com/0xposa/olliecode-setup/main/install-mac.sh | bash
```

Lalu:
```bash
source ~/.zshrc
olliecode
```

## Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/0xposa/olliecode-setup/main/install-windows.ps1 | iex
```

Tutup & buka ulang PowerShell, lalu:
```powershell
opencode
```

## Shortcut (Linux / macOS)

| Perintah | Fungsi |
|---|---|
| `olliecode` | Buka olliEcode |

## Uninstall (Linux / macOS)

```bash
rm -rf ~/.ollie
sed -i '/alias olliecode/d' ~/.bashrc ~/.zshrc 2>/dev/null
```

## Catatan

- Data disimpan di `~/.ollie` — OpenCode asli tidak tersentuh.
- Repo sumber: `https://gitlab.com/123-group5802346/olliecode`
