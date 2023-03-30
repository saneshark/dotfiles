# Source Prezto (by Sorin Ionescu <sorin.ionescu@gmail.com>).
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -f ~/.zaliases ]; then
  source ~/.zaliases
fi
