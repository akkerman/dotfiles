" install:
" % git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" % vim +PluginInstall +qall
" % mkdir -p ~/.fonts/ && cd "$_"
" % wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
" % mkdir -p ~/.config/fontconfig/config.d && cd "$_"
" % wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
" % fc-cache -vf ~/.fonts/

" vundle
    set nocompatible              " be iMproved, required for vundle
    filetype off                  " required for vundle

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        " let Vundle manage Vundle, required for vundle
        Plugin 'VundleVim/Vundle.vim'

        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'

        Plugin 'tpope/vim-fugitive' " for git branch

        " All of your Plugins must be added before the following line
    call vundle#end()             " required for vundle

    filetype plugin indent on     " required for vundle

" airline symbols
    let g:airline_powerline_fonts = 1

" colors
    syntax enable
    set background=dark

" statusline (vim-airline)
    set laststatus=2 " always on
    let g:airline#extensions#tabline#enabled = 1

" tabs
    set tabstop=4    " show existing tabs as 4 spaces
    set shiftwidth=4 " indent 4 spaces with '>'
    set expandtab    " insert 4 spaces when pressing tab

" new files
    augroup newfile
      au!
      autocmd BufNewFile Dockerfile 0r ~/.vim/template/Dockerfile
      autocmd BufNewFile *.html     0r ~/.vim/template/html
    augroup END

" hybrid linenumbers
    set relativenumber
    set number 

