#!/bin/bash

VILA=$HOME/.vila

# Install vila
git clone https://github.com/gavinkflam/vila.git ~/.vila

# Merge files to home directory
cp -rf $VILA/home/. $HOME

# Install plugins for oh-my-zsh
$VILA/config/.oh-my-zsh/custom/plugins/install.sh

# Install plugins for vim
nvim -u $VILA/config/.config/nvim/plugins_only.vim \
  -c ':PlugInstall' \
  -c 'qa!'
