# Source Prezto (by Sorin Ionescu <sorin.ionescu@gmail.com>).
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -f ~/.zaliases ]; then
  source ~/.zaliases
fi

# chruby configuration
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
