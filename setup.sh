#!/bin/bash

# This setup file will clone the Vundle vim plugin as well as
# create a symlink to _vimrc from your root directory as .vimrc

script_dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
vundle_path="$script_dir/bundle/Vundle.vim"
vimrc_path="$script_dir/_vimrc"

echo "Starting setup..."

mkdir -p bundle

if cd $vundle_path; then
  echo "Vundle already exists...skipping cloning of Vundle..."
else
  echo "Cloning Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim $vundle_path
fi

if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
  echo "~/.vimrc already exits...skipping symlink creation..."
else
  ln -s $vimrc_path ~/.vimrc
fi

echo "...Setup complete!"

