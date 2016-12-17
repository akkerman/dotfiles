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

        Plugin 'tpope/vim-fugitive'      " for git commands and branch in statusbar
        Plugin 'tpope/vim-commentary'    " gc adds comments
        Plugin 'tpope/vim-surround'      " ys,cs,ds - add,change,del surround

        Plugin 'edkolev/tmuxline.vim'    " for tmux status line
        Plugin 'tmux-plugins/vim-tmux'   " syntax + more (shift+K for help e.g.)

        Plugin 'ternjs/tern_for_vim'     " code-analysis engine for JavaScript
        Plugin 'Valloric/YouCompleteMe'  " code-completion engine for Vim

        Plugin 'vim-syntastic/syntastic' " syntax checking

        Plugin 'gisphm/vim-gitignore'
        Plugin 'wikitopian/hardmode'

        Plugin 'ctrlpvim/ctrlp.vim'
        Plugin 'ludovicchabant/vim-ctrlp-autoignore'

        Plugin 'SirVer/ultisnips'
        Plugin 'honza/vim-snippets'

        Plugin 'akkerman/vim-jasmine'
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
    highlight Normal ctermbg=none " no background, (transparant)

" statusline (vim-airline)
    set laststatus=2   " always on
    let g:airline#extensions#tabline#enabled = 1

" tabs
    set tabstop=4      " show existing tabs as 4 spaces
    set shiftwidth=4   " indent 4 spaces with '>'
    set expandtab      " insert 4 spaces when pressing tab

" various
    set history=200    " open with q:
    set nowrap         " do NOT wrap long lines
    set hidden         " when buffer modified and not in a window
    set autowrite      " just write file to disk in a lot of cases

" various
    set history=200  " open with q:
    set nowrap       " do NOT wrap long lines
    set hlsearch     " highlight matching searches
    set incsearch    " show first match while typing search

" new files
    augroup newfile
      autocmd!
      autocmd BufNewFile Dockerfile    0r ~/.vim/template/Dockerfile
      autocmd BufNewFile *.html        0r ~/.vim/template/html
      autocmd BufNewFile .tern-project 0r ~/.vim/template/tern-project
    augroup END

" hybrid linenumbers
    set relativenumber
    set number

" finding files # https://www.youtube.com/watch?v=XA2WjJbmmoM
    set path+=**
    set wildmenu
    set wildmode=full

"  windows
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" syntax checking
    let g:airline#extensions#syntastic#enabled = 1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ["eslint"]

" tweaks for browsing
    let g:netrw_banner = 1
    let g:netrw_list_hide = netrw_gitignore#Hide()
    let g:netrw_liststyle = 3 " treeview
    let g:ctrlp_extensions = ['autoignore'] " .ctrlpignore

" snippets
    let g:UltiSnipsExpandTrigger="<c-j>"

" automate stuff
    augroup my_stuff
        autocmd!
        autocmd bufwritepost $MYVIMRC source $MYVIMRC " source vimrc after saving
        autocmd BufReadPost,BufNewFile *.spec.js set filetype=javascript-jasmine syntax=jasmine
    augroup END
