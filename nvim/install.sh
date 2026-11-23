#!/bin/bash

set -e

INSTALL_NVIM=true

if [[ "$1" == "-no_nvim" ]]; then
    INSTALL_NVIM=false
fi

echo "=== Setting up Neovim environment ==="

# 1. Install system dependencies
echo "Installing system packages..."

sudo apt update
sudo apt install -y \
    git \
    build-essential \
    curl \
    unzip \
    ripgrep \
    fd-find \
    npm \
    python3-pip \
    python3-venv \
    clang-tidy \
    clang-format \
    lazygit \
    tree-sitter-cli

# 2. Install Neovim
if [[ "$INSTALL_NVIM" == true ]]; then
    echo "Installing Neovim..."

    mkdir -p ~/.local

    curl -LO "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"

    tar -xzf nvim-linux-x86_64.tar.gz --strip-components=1 -C ~/.local

    rm nvim-linux-x86_64.tar.gz
else
    echo "Skipping Neovim installation."
fi

# 3. Setup Neovim configuration
echo "Symlinking Neovim configuration..."

NVIM_DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG_DIR="$HOME/.config/nvim"

mkdir -p "$HOME/.config"

# Back up any existing real directory/file that isn't already a symlink
if [[ -e "$NVIM_CONFIG_DIR" && ! -L "$NVIM_CONFIG_DIR" ]]; then
    echo "Backing up existing config to ${NVIM_CONFIG_DIR}.bak..."
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.bak"
fi

ln -sfn "$NVIM_DOTFILES_DIR" "$NVIM_CONFIG_DIR"

# 4. Add local bin to PATH
if ! grep -Fqx 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

export PATH="$HOME/.local/bin:$PATH"
