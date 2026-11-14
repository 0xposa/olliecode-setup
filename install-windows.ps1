# ============================================================
# olliEcode — installer Windows (PowerShell)
# ============================================================
$ErrorActionPreference = "Stop"

$Repo   = "https://github.com/0xposa/olliecode-setup"
$BinDir = "$env:LOCALAPPDATA\olliecode\bin"
$Bin    = "$BinDir\olliecode.exe"
$Asset  = "opencode-windows-x64.gz"

Write-Host "Download $Asset ..."
New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
$gz = "$env:TEMP\opencode.gz"
Invoke-WebRequest -Uri "$Repo/releases/latest/download/$Asset" -OutFile $gz

# Windows 10+ punya tar bawaan yang bisa extract gzip
tar -xzf $gz -C $BinDir
Move-Item -Force "$BinDir\opencode" $Bin
Remove-Item $gz

# Tambah ke PATH (user)
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$BinDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$BinDir", "User")
}

Write-Host ""
Write-Host "SELESAI."
Write-Host "Tutup & buka ulang PowerShell, lalu jalankan:"
Write-Host "  olliecode"
