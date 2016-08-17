#!/bin/bash
# This script installs symlinks to dotfiles

### variables
dir=~/dotfiles
olddir=~/dotfiles_old
files="zaliases zexports zlogin zlogout zprezto zpreztorc zprofile zshenv zshrc"

####
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"

# create symlinks backing up duplicates
for file in $files; do
  echo "moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file ~/dotfiles_old/
  echo "creating symlink to $file in home directory"
  ln -s $dir/.$file ~/.$file
done
