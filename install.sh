#!/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.fonts/ && cd "$_"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
mkdir -p ~/.config/fontconfig/config.d && cd "$_"
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
