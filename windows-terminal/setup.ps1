# Relaunch as Administrator if not elevated
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)) {
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

# Windows Terminal paths
$wtDir = Join-Path $env:LOCALAPPDATA "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$wtPath = Join-Path $wtDir "settings.json"

# Dotfiles settings.json
$target = Join-Path $PSScriptRoot "settings.json"

# Ensure destination directory exists
New-Item -ItemType Directory -Path $wtDir -Force | Out-Null

# Remove existing settings file or symlink
Remove-Item -Path $wtPath -Force -ErrorAction SilentlyContinue

# Create symbolic link
New-Item -ItemType SymbolicLink -Path $wtPath -Target $target

Write-Host "Windows Terminal settings symlink created successfully!" -ForegroundColor Green
Read-Host "Press Enter to exit"
