# Dotfiles

Dotfiles, install scripts, and more...

## How to use

# Brew : The missing package manager for macOS
# https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Sublimte Text: text editor with multi line select
brew install --cask sublime-text

# Prezto: A better way to zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# VS Code: Basic IDE
brew install --cask visual-studio-code


# iterm: better terminal emulator
brew cask install iterm3


See install.sh
Currently just supports zsh with Prezto

Looking to add additional configuration to support installing
brew, rbenv, ruby, etc
