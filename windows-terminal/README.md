# Windows Terminal Setup

## 1. Install Nerd Font

Download and install **JetBrainsMono Nerd Font** so icons and glyphs render properly:

- Download from [Nerd Fonts](https://nerdfonts.com), extract the `.zip`, select all `.ttf` files, right-click, and select \*\*Install\*\*.

## 2. Symlink Configuration

Clone this repository, remove the default `settings.json` (if present), and create a symlink in PowerShell *(requires Developer Mode enabled or an Administrator terminal)*:

```powershell
git clone <repo-url> "\\$HOME\\dotfiles"

wtPath = "env:LOCALAPPDATA\\Packages\\Microsoft.WindowsTerminal\_8wekyb3d8bbwe\\LocalState\\settings.json"

Remove-Item \\$wtPath -Force -ErrorAction SilentlyContinue

New-Item -ItemType SymbolicLink -Path wtPath -Target "HOME\\dotfiles\\windows-terminal\\settings.json"
```