setl fdm=expr
setl fde=BrsFold(v:lnum)
setl fml=2

func! BrsFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let lind = s:IndentLevel(a:lnum)
    let plind = s:IndentLevel(prevnonblank(a:lnum-1))
    let nlind = s:IndentLevel(nextnonblank(a:lnum+1))

    if plind > lind && getline(a:lnum) =~? '\v\c^\s*#?(end|else)>'
        return plind
    elseif nlind == lind
        return lind
    elseif nlind < lind
        return lind
    elseif nlind > lind
        return '>' . (lind + 1)
    endif
endfunc

func! s:IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunc

func! s:NextNonBlankLine(lnum)
    let numlines = line('$')
    
    for current in range(a:lnum + 1, numlines)
        if getline(current) =~? '\v\S'
            return current
        endif
    endfor

    return -2
endfunc

func! s:PrevNonBlankLine(lnum)
    for current in range(a:lnum - 1, 0, -1)
        if getline(current) =~? '\v\S'
            return current
        endif
    endfor

    return -2
endfunc
