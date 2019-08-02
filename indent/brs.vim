if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setl nolisp
setl nocindent
setl autoindent
setl indentkeys=0{,0},0[,0],e,o,O,!^F,=~end,=~else,=~next,=~#end,=~#else
setl indentexpr=BrsIndent(v:lnum)

if exists("*BrsIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

func! BrsIndent(lnum) abort
    let indent_condcomp = exists("g:roku_indent_condcomp")?g:roku_indent_condcomp:0
    let plnum = prevnonblank(a:lnum-1)
    if plnum == 0
        return 0
    endif

    let pline = substitute(getline(plnum), "'.*$", "", "")
    let line = substitute(getline(a:lnum), "'.*$", "", "")
    let pind = indent(plnum)

    let ind = pind

    if pline =~? '\v^\s*(function|sub)> \i+\(.*\)( as [A-z]+)?'
        let ind += shiftwidth()
    elseif pline =~? '\v^\s*for (\S+ \= \S+ to \S+( step \S+)?)|(each \S+ in (\S+|"[^"]*"|\[.*\]|\{.*\})+)'
        let ind += shiftwidth()
    elseif pline =~? '\v^\s*(else )?(if|while) ?(not )?(\S+|"[^"]*")+' . 
                \ '(\s*([-+*/^><=]{1,2}|and|or)\s*(not )?(\S+|"[^"]*"))*( then)?\s*$'
        " indent lines after `if' statements, but only if it's not a one-line `if'
        let ind += shiftwidth()
    elseif indent_condcomp && pline =~? '\v^\s*#(else( if)?|if)>.*'
        " indent lines in conditional compilation if statements
        let ind += shiftwidth()
    elseif pline =~? '\v^\s*<else>\s*$'
        let ind += shiftwidth()
    endif

    if (pline =~ '[' && pline !~ ']') || (pline =~ '{' && pline !~ '}') || (pline =~ '(' && pline !~ ')')
        let ind += shiftwidth()
    endif 
    if (line =~ ']' && line !~ '[') || (line =~ '}' && line !~ '{') || (line =~ ')' && line !~ '(')
        let ind -= shiftwidth()
    endif

    if line =~? '\v^\s*(end|next|else)>' ||
                \ (indent_condcomp && line =~? '\v^\s*#(end|else)')
        let ind -= shiftwidth()
    endif

    return ind
endfunc

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:et:sw=4:ts=4
