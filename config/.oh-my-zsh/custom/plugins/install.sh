#!/bin/bash

dir=$VILA/config/.oh-my-zsh/custom/plugins

# Install zsh-completions
git clone https://github.com/zsh-users/zsh-completions $dir/zsh-completions &

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $dir/zsh-autosuggestions &

wait

