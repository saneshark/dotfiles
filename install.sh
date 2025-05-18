#!/bin/bash

# Exit on error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

### variables
DOTFILES_DIR=~/Projects/dotfiles
OLD_DOTFILES_DIR=~/Projects/dotfiles/dotfiles_old
DOTFILES="zaliases zexports zlogin zlogout zprezto zpreztorc zprofile zshenv zshrc"

# Function to print status messages
print_status() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}==>${NC} $1"
}

print_error() {
    echo -e "${RED}==>${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is only for macOS"
    exit 1
fi

# Install Xcode Command Line Tools
print_status "Checking for Xcode Command Line Tools..."
if ! xcode-select -p &> /dev/null; then
    print_status "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait for installation to complete
    while ! xcode-select -p &> /dev/null; do
        sleep 1
    done
    print_success "Xcode Command Line Tools installed"
else
    print_status "Xcode Command Line Tools already installed"
fi

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
else
    print_status "Homebrew already installed"
fi

# Install essential packages
print_status "Installing essential packages..."
brew install \
    git \
    chruby \
    ruby-install \
    zsh \
    zsh-completions \
    zsh-syntax-highlighting

# Install latest Ruby
print_status "Installing latest Ruby..."
ruby-install ruby

# Install Prezto
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    print_status "Installing Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    print_success "Prezto installed"
else
    print_status "Prezto already installed"
fi

# Backup existing dotfiles
print_status "Creating backup directory for existing dotfiles..."
mkdir -p "$OLD_DOTFILES_DIR"

# Create symlinks for dotfiles
print_status "Setting up dotfiles..."
for file in $DOTFILES; do
    if [ -f "$HOME/.$file" ]; then
        print_status "Backing up ~/.$file to $OLD_DOTFILES_DIR"
        mv "$HOME/.$file" "$OLD_DOTFILES_DIR/"
    fi
    print_status "Creating symlink for .$file"
    ln -s "$DOTFILES_DIR/.$file" "$HOME/.$file"
done

# Install Cursor if not present
if [ ! -d "/Applications/Cursor.app" ]; then
    print_status "Installing Cursor..."
    brew install --cask cursor
    print_success "Cursor installed"
else
    print_status "Cursor already installed"
fi

# Set up shell
print_status "Setting up shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    print_success "Default shell changed to zsh"
else
    print_status "zsh is already the default shell"
fi

print_success "Installation complete! Please restart your terminal."
