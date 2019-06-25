if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setl nolisp
setl nocindent
setl autoindent
setl indentkeys=0{,0},0[,0],e,o,O,!^F,=~end,=~else,=~next
setl indentexpr=BrsIndent(v:lnum)
"setl foldmethod=indent

if exists("*BrsIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

func! BrsIndent(lnum) abort
    let plnum = prevnonblank(a:lnum-1)
    if plnum == 0
        return 0
    endif

    let pline = substitute(getline(plnum), "'.*$", "", "")
    let line = substitute(getline(a:lnum), "'.*$", "", "")
    let pind = indent(plnum)

    let ind = pind

    if pline =~ '\c^\s*\(function\|sub\)\> \i\+(.*)\( as [A-z]\+\)\?'
        let ind += shiftwidth()
    elseif pline =~ '\c^\s*for \(\S\+ = \S\+ to \S\+\( step \S\+\)\?\)\|\(each \S\+ in \(\S\+\|"[^"]*"\|\[.*\]\|{.*}\)\+\)'
        let ind += shiftwidth()
    elseif pline =~ '\c^\s*\(else \)\?\(if\|while\) \?\(not \)\?\(\S\+\|"[^"]*"\)\+\(\s*\([-+*/^><=]\{1,2}\|and\|or\)\s*\(not \)\?\(\S\+\|"[^"]*"\)\)*\(then\)\?\s*$'
        " indent lines after `if' statements only if it's not a one-line `if'
        let ind += shiftwidth()
    elseif pline =~ '\c^\s*\<else\>\s*$'
        let ind += shiftwidth()
    endif

    if (pline =~ '[' && pline !~ ']') || (pline =~ '{' && pline !~ '}')
        let ind += shiftwidth()
    endif 
    if (line =~ ']' && line !~ '[') || (line =~ '}' && line !~ '{')
        let ind -= shiftwidth()
    endif

    if line =~ '\c^\s*\<end\>'
        let ind -= shiftwidth()
    elseif line =~ '\c^\s*\<next\>'
        let ind -= shiftwidth()
    elseif line =~ '\c^\s*\<else\>'
        let ind -= shiftwidth()
    endif

    return ind
endfunc

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:et:sw=4:ts=4
