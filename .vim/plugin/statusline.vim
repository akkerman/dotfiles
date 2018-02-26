
" left aligned
set statusline=%f\ %y  " relative filename + space + filetype

" right aligned
set statusline+=%=     " split point for left and right
set statusline+=%{LinterStatus()}


function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
