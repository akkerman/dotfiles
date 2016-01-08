set background=dark
augroup newfile
  au!
  autocmd BufNewFile Dockerfile 0r ~/.vim/template/Dockerfile
  autocmd BufNewFile *.html     0r ~/.vim/template/html
augroup END

filetype plugin on
set omnifunc=syntaxcomplete#Complete
:iabbrev </ </<C-X><C-O>
