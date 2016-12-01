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
        Plugin 'altercation/vim-colors-solarized'

        Plugin 'tpope/vim-fugitive' " for git commands and branch in statusbar
        Plugin 'edkolev/tmuxline.vim' " for tmux status line

        Plugin 'tmux-plugins/vim-tmux' " syntax + more (shif+K for help e.g.)

        " All of your Plugins must be added before the following line
    call vundle#end()             " required for vundle

    filetype plugin indent on     " required for vundle

" airline symbols
    let g:airline_powerline_fonts = 1

" colors
    syntax enable
    set background=dark
    set t_Co=16 " set colors of terminal
    "let g:solarized_termcolors=256
    silent! colorscheme solarized

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

" finding files # https://www.youtube.com/watch?v=XA2WjJbmmoM
    set path+=**
    set wildmenu
