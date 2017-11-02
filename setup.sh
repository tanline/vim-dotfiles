#!/bin/bash

# This setup file will clone the Vundle vim plugin as well as
# create a symlink to _vimrc from your root directory as .vimrc

script_dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
plug_path="$script_dir/autoload/plug.vim"
vimrc_path="$script_dir/_vimrc"

printf "Starting setup...\n\n"

printf "Cloning Plug...\n"
if [ -e $plug_path ] || [ -L $plug_path ]; then
  printf "Plug already installed. Use :PluginUpgrade in vim to update.\n"
else
  curl -fLo $plug_path --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

printf "\nCreating vimrc symlink...\n"
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
  printf "~/.vimrc already exits...skipping symlink creation...\n"
else
  ln -s $vimrc_path ~/.vimrc
fi

printf "\nSetup complete!\n"
