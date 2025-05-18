# Dotfiles

My personal dotfiles and development environment setup for macOS.

## Features

- Zsh with Prezto for a better shell experience
- Ruby development environment with chruby
- Cursor as the primary code editor
- Git configuration
- Custom aliases and environment variables

## Installation

### Automatic Installation

The easiest way to set up everything is to run the installation script:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./install.sh
```

This script will:
1. Install Xcode Command Line Tools
2. Install and configure Homebrew
3. Install essential development tools
4. Set up Ruby with chruby
5. Install and configure Prezto
6. Install Cursor
7. Set up all dotfiles with proper symlinks

### Manual Installation

If you prefer to install components manually:

1. Install Xcode Command Line Tools:
   ```bash
   xcode-select --install
   ```

2. Install Homebrew:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Install essential packages:
   ```bash
   brew install git chruby ruby-install zsh zsh-completions zsh-syntax-highlighting
   ```

4. Install Prezto:
   ```bash
   git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
   ```

5. Install Cursor:
   ```bash
   brew install --cask cursor
   ```

## Structure

- `.zshrc` - Main shell configuration
- `.zaliases` - Custom shell aliases
- `.zprofile` - Shell profile settings
- `.zexports` - Environment variables
- `install.sh` - Installation script
- `.gitignore` - Git ignore rules

## Customization

After installation, you can customize your environment by:

1. Editing the dotfiles in `~/Projects/dotfiles`
2. Running `reload` to apply changes to your current shell session

## Contributing

Feel free to fork this repository and customize it for your own use.

## License

This project is open source and available under the MIT License.
