#!/bin/bash

VILA=$HOME/.vila

# Install vila
git clone git@github.com:gavinkflam/vila.git ~/.vila

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0

# Install on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install vim-plug
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Merge files to home directory
cp -rf $VILA/home/. $HOME

# Install plugins for oh-my-zsh
$VILA/config/.oh-my-zsh/custom/plugins/install.sh

# Install plugins for vim
nvim -u $VILA/config/.config/nvim/plugins_only.vim \
  -c ':PlugInstall' \
  -c 'qa!'

