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

        " All of your Plugins must be added before the following line
    call vundle#end()             " required for vundle

    filetype plugin indent on     " required for vundle
 
" airline symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''

" tabs
    set tabstop=4    " show existing tabs as 4 spaces
    set shiftwidth=4 " indent 4 spaces with '>'
    set expandtab    " insert 4 spaces when pressing tab

" colors
    set background=dark

" new files
    augroup newfile
      au!
      autocmd BufNewFile Dockerfile 0r ~/.vim/template/Dockerfile
      autocmd BufNewFile *.html     0r ~/.vim/template/html
    augroup END

" statusline (vim-airline)
    set laststatus=2 " always on
    let g:airline#extensions#tabline#enabled = 1
