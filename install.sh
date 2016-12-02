#!/bin/bash

# install bundler and ask it to install the plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# download and configure fonts for airline status line
mkdir -p ~/.fonts/ && cd "$_"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
mkdir -p ~/.config/fontconfig/config.d && cd "$_"
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
ln -sf ~/.config/fontconfig/config.d ~/.fontconfig
fc-cache -f -v ~/.fonts/

# install npm dependancies for tern
cd ~/.vim/bundle/tern_for_vim
npm install

# compile YouCompleteMe with support for javascript
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
