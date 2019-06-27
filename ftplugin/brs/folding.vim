setl fdm=expr
setl fde=BrsFold(v:lnum)
setl fml=2
%foldo!

func! s:BrsFold(lnum)
    if getline(lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let lind = IndentLevel(lnum)
    let plind = IndentLevel(PrevNonBlankLine(lnum))
    let nlind = IndentLevel(NextNonBlankLine(lnum))

    if plind > lind && getline(lnum) =~? '\v\c^\s*#?(else|end)>'
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
    return indent(lnum) / &shiftwidth
endfunc

func! s:NextNonBlankLine(lnum)
    let numlines = line('$')
    
    for current in range(lnum + 1, numlines)
        if getline(current) =~? '\v\S'
            return current
        endif
    endfor

    return -2
endfunc

func! s:PrevNonBlankLine(lnum)
    for current in range(lnum - 1, 0, -1)
        if getline(current) =~? '\v\S'
            return current
        endif
    endfor

    return -2
endfunc
