set background=dark
augroup newfile
  au!
  autocmd BufNewFile Dockerfile 0r ~/.vim/template/Dockerfile
  autocmd BufNewFile *.html     0r ~/.vim/template/html
augroup END

