#!/usr/bin/env bash
# This script creates symbolic links for configuration files

set -e  # Exit immediately if a command exits with a non-zero status

# Define file locations
SRC_DIR="$(pwd)"
TARGET_ZSH="$HOME/.zshrc"
TARGET_TMUX="$HOME/.tmux.conf"
TARGET_NVIM="${XDG_CONFIG_HOME:-$HOME/.config}/neovim/init.vim"

# Create the directory for Neovim config if it doesn't exist
mkdir -p "$(dirname "$TARGET_NVIM")"

# Function to create a symbolic link safely
create_symlink() {
    local src="$1"
    local dest="$2"

    # Remove existing symlink or file if it exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Removing existing file or link at $dest"
        rm -rf "$dest"
    fi

    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

# Create symlinks
create_symlink "$SRC_DIR/zshrc" "$TARGET_ZSH"
create_symlink "$SRC_DIR/tmux.conf" "$TARGET_TMUX"
create_symlink "$SRC_DIR/neovim_config.vim" "$TARGET_NVIM"

echo "All symbolic links created successfully!"
