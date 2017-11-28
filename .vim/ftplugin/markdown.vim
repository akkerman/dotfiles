silent! call airline#extensions#whitespace#disable()

set makeprg=markdown-pdf\ -s\ ~/Documents/creetion-markdown-template.css\ %

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Headings',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3',
        \ 'l:Heading_L4'
    \ ],
    \ 'sort': 0,
\ }
