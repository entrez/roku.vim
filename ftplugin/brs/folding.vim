setl fdm=expr
setl fde=BrsFold(v:lnum)
setl fml=2

func! BrsFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let lind = s:indentCt(a:lnum)
    let plind = s:indentCt(prevnonblank(a:lnum-1))
    let nlind = s:indentCt(nextnonblank(a:lnum+1))

    if plind > lind && getline(a:lnum) =~? '\v^\s*(#?(end|else)>|[]})])'
        return plind
    elseif nlind > lind
        return '>' . nlind
    elseif nlind <= lind
        return lind
    endif
endfunc

func! s:indentCt(lnum)
    return indent(a:lnum) / &shiftwidth
endfunc
