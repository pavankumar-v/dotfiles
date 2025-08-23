#!/bin/bash

# This script automates the installation of dotfiles.

# Define the dotfiles directory
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"
CONFIG_DIR="$HOME/.config"

echo "Starting dotfiles installation..."

# 1. Clone the repository
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository to $DOTFILES_DIR..."
    git clone git@github.com:pavankumar-v/dotfiles.git "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists at $DOTFILES_DIR. Skipping clone."
fi

# 2. Backup existing dotfiles
echo "Backing up existing dotfiles to $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

# Backup .zshrc
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$BACKUP_DIR/.zshrc"
    echo "Backed up ~/.zshrc"
fi

# Backup alacritty.toml
if [ -f "$CONFIG_DIR/alacritty/alacritty.toml" ]; then
    mkdir -p "$BACKUP_DIR/alacritty"
    mv "$CONFIG_DIR/alacritty/alacritty.toml" "$BACKUP_DIR/alacritty/alacritty.toml"
    echo "Backed up ~/.config/alacritty/alacritty.toml"
fi

# Backup zellij config.kdl
if [ -f "$CONFIG_DIR/zellij/config.kdl" ]; then
    mkdir -p "$BACKUP_DIR/zellij"
    mv "$CONFIG_DIR/zellij/config.kdl" "$BACKUP_DIR/zellij/config.kdl"
    echo "Backed up ~/.config/zellij/config.kdl"
fi

# 3. Create symlinks for the new dotfiles
echo "Creating symlinks for new dotfiles..."

# .zshrc
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
echo "Symlinked ~/.zshrc"

# Alacritty config
mkdir -p "$CONFIG_DIR/alacritty"
ln -sf "$DOTFILES_DIR/alacritty/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"
echo "Symlinked ~/.config/alacritty/alacritty.toml"

# Zellij config
mkdir -p "$CONFIG_DIR/zellij"
ln -sf "$DOTFILES_DIR/zellij/config.kdl" "$CONFIG_DIR/zellij/config.kdl"
echo "Symlinked ~/.config/zellij/config.kdl"

# 4. Reload your shell
echo "Reloading Zsh shell..."
source "$HOME/.zshrc"

echo "Dotfiles installation complete!"
echo "Please restart your terminal applications (Alacritty, Zellij) to apply all changes."
