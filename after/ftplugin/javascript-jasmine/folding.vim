function! JasmineFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^\s*\(f\|x\)\?\(describe\|it\)(') >=0
        return ">2"
    elseif match(thisline, '^\s*\(after\|before\)\(Each\|All\)') >= 0
        return ">3"
    else
        return "="
    endif
endfunction

function! JasmineFoldText()
    let thisline = getline(v:foldstart)
    if match(thisline, '\(describe\|it\)') >=0
        let thisline = substitute(thisline, '^\(\s*\)\(.\+\)("\(.\+\)".*', '\1\3', '')
        let thisline = substitute(thisline, '\(\s*\)(.\+\)(''\(.\+\)''.*', '\1\3', '')
    endif

    return thisline
endfunction

setlocal foldmethod=expr
setlocal foldexpr=JasmineFolds()
setlocal foldtext=JasmineFoldText()
