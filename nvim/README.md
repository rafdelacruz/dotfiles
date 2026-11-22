# Neovim Setup

## 1. Install system dependencies
```bash
sudo apt update
sudo apt install git build-essential curl unzip ripgrep fd-find npm python3-pip python3-venv clang-tidy clang-format lazygit tree-sitter-cli
```

## 2. Install Neovim

```bash
# 1. Download the official Linux x86_64 tarball
curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"

# 2. Extract bin/, lib/, and share/ directly into ~/.local/
mkdir -p ~/.local
tar -xzf nvim-linux-x86_64.tar.gz --strip-components=1 -C ~/.local

# 3. Clean up the downloaded archive
rm nvim-linux-x86_64.tar.gz

# 4. Ensure ~/.local/bin is in your PATH (add to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.local/bin:$PATH"`
```

## 3. Install configuration

Clone this repository, then symlink the Neovim config:

```bash
git clone <repo-url> ~/dotfiles

ln -s ~/dotfiles/nvim ~/.config/nvim
```

## 4. First launch

Open Neovim:

```bash
nvim
```

lazy.nvim automatically installs plugins, and Mason installs the configured language servers:

- lua_ls
- pyright
- clangd
- jsonls
