#!/bin/bash

vila=~/vila

# Install vila
git clone https://github.com/gavinkflam/vila.git ~/vila

# Install on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install vim-plug
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Merge files to home directory
cp -rf $vila/home/. $HOME

# Install plugins for oh-my-zsh
$HOME/.oh-my-zsh/custom/plugins/install.sh

# Install plugins for vim
nvim -u ~/.config/nvim/plugins_only.vim \
  -c ':PlugInstall' \
  -c 'qa!'

