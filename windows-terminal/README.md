# Windows Terminal Setup

## Quick setup

```powershell
cd dotfiles/nvim

.\setup.ps1
```

## 1. Install Nerd Font

Download and install **JetBrainsMono Nerd Font** so icons and glyphs render properly:

- Download from [Nerd Fonts](https://nerdfonts.com), extract the `.zip`, select all `.ttf` files, right-click, and select \*\*Install\*\*.

## 2. Symlink Configuration

Clone this repository, remove the default `settings.json` (if present), and create a symlink in PowerShell *(requires Developer Mode enabled or an Administrator terminal)*:

```powershell
git clone <repo-url> "$HOME\Downloads\dotfiles"

$wtDir = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$wtPath = Join-Path $wtDir "settings.json"

# Absolute path to settings.json alongside this script
$target = Join-Path $PSScriptRoot "settings.json"

New-Item -ItemType Directory -Path $wtDir -Force | Out-Null
Remove-Item -Path $wtPath -Force -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path $wtPath -Target $target
```
