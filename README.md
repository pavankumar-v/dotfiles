# Pavan's Dotfiles

This repository contains my personal dotfiles for various tools and applications. These configurations are designed to streamline my workflow and provide a consistent development environment.

## Contents

- **`.zshrc`**: My Zsh shell configuration, including aliases, functions, and prompt customization.
- **`alacritty/alacritty.toml`**: Configuration for the Alacritty GPU-accelerated terminal emulator.
- **`zellij/config.kdl`**: Configuration for the Zellij terminal multiplexer.

## Installation

### Automated Installation

You can use the provided `install.sh` script to automate the setup process.

1. **Clone the repository:**

   ```bash
   git clone git@github.com:pavankumar-v/dotfiles.git ~/.dotfiles
   ```

2. **Run the installation script:**

   ```bash
   cd ~/.dotfiles
   chmod +x install.sh
   ./install.sh
   ```

The script will:
- Clone the repository (if not already present).
- Backup your existing dotfiles to `~/.dotfiles_backup`.
- Create symbolic links for `.zshrc`, `alacritty.toml`, and `zellij/config.kdl` to their respective locations.
- Reload your Zsh shell.

### Manual Installation

To set up these dotfiles manually, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone git@github.com:pavankumar-v/dotfiles.git ~/.dotfiles
   ```

2. **Backup existing dotfiles (optional but recommended):**

   ```bash
   mkdir -p ~/.dotfiles_backup
   mv ~/.zshrc ~/.dotfiles_backup/
   mv ~/.config/alacritty/alacritty.toml ~/.dotfiles_backup/
   mv ~/.config/zellij/config.kdl ~/.dotfiles_backup/
   ```

3. **Create symlinks for the new dotfiles:**

   ```bash
   ln -s ~/.dotfiles/.zshrc ~/.zshrc
   mkdir -p ~/.config/alacritty
   ln -s ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
   mkdir -p ~/.config/zellij
   ln -s ~/.dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
   ```

4. **Reload your shell:**

   ```bash
   source ~/.zshrc
   ```
## Usage

### Zsh

The `.zshrc` file configures your Zsh shell. It includes:
- Custom aliases for frequently used commands.
- Functions to enhance productivity.
- A customized prompt.

After installation, open a new terminal session to see the changes.

### Alacritty

The `alacritty/alacritty.toml` file configures the Alacritty terminal emulator. It includes:
- Font settings.
- Color schemes.
- Keybindings.

Alacritty will automatically pick up the changes after you restart it.

### Zellij

The `zellij/config.kdl` file configures the Zellij terminal multiplexer. It includes:
- Layouts.
- Keybindings.
- Plugin settings.

Zellij will apply the new configuration when you start a new session or reload an existing one (e.g., by pressing `Ctrl-s r`).

## Contributing

Feel free to fork this repository and customize these dotfiles to your liking. If you have any improvements or suggestions, please open an issue or submit a pull request.
