let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/roku_scripts/'

func! communicate#RokuMessage(...)
    if !exists('g:roku_ip')
        echoh ErrorMsg | echom 'roku: missing valid hostname or ip - set g:roku_ip'
        return
    elseif a:0 == 0
        echoh ErrorMsg | echom 'roku: no message included - use RokuMsg <text>'
        return
    endif
    let target_device = type(g:roku_ip) == 3 ? g:roku_ip[0] : g:roku_ip

    let result = system(s:path . 'remote ' . target_device . ' -m ' . a:1)
    if len(result) > 0
        echoh ErrorMsg | echom s:result
    endif
endfunc

func! communicate#RokuRemote(...)
    if !exists('g:roku_ip')
        echoh ErrorMsg | echom 'roku: missing valid hostname or ip - set g:roku_ip'
        return
    elseif a:0 == 0
        echoh ErrorMsg | echom 'roku: no key name included - use RokuRemote <key>'
        return
    endif
    let target_device = type(g:roku_ip) == 3 ? g:roku_ip[0] : g:roku_ip

    let result = system(s:path . 'remote ' . target_device . ' -k ' . a:1)
    if len(result) > 0
        echoh ErrorMsg | echom s:result
    endif
endfunc
