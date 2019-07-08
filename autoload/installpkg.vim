let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h') . '/roku_scripts/'

func! installpkg#RokuInstall(...)
    if !exists('g:roku_ip') && a:0 == 0
        echoh ErrorMsg | echom 'roku: missing valid hostname or ip - set g:roku_ip or use RokuInstall <ip>'
        return
    elseif !exists('g:roku_username')
        echoh ErrorMsg | echom 'roku: missing device username - set g:roku_username'
        return
    elseif !exists('g:roku_password')
        echoh ErrorMsg | echom 'roku: missing device password - set g:roku_password'
        return
    endif

    let s:roku_ip = a:0 > 0 ? a:1 : g:roku_ip

    echoh Normal | echom 'compressing channel & uploading to roku (' . s:roku_ip . ')'
    let s:result = split(system(s:path . 'install "' . bufname('%') . '" -u ' . g:roku_username . ':' . g:roku_password .
                \ ' -d ' . s:roku_ip), '\n')
    echom join(s:result)
endfunc

func! installpkg#RokuPackage(...)
    if !exists('g:roku_ip') && a:0 == 0
        echoh ErrorMsg | echom 'roku: missing valid hostname or ip - set g:roku_ip or use RokuPackage <ip>'
        return
    elseif !exists('g:roku_pkg_pass')
        echoh ErrorMsg | echom 'roku: missing packaging password - set g:roku_pkg_pass'
        return
    elseif !exists('g:roku_username')
        echoh ErrorMsg | echom 'roku: missing device username - set g:roku_username'
        return
    elseif !exists('g:roku_password')
        echoh ErrorMsg | echom 'roku: missing device password - set g:roku_password'
        return
    endif

    let s:roku_ip = a:0 > 0 ? a:1 : g:roku_ip
    let s:remove = !exists('g:roku_remove_old') || g:roku_remove_old ? ' --remove-old ' : ' '

    echoh Normal | echom 'packaging channel'
    let s:result = split(system('cd "' . fnamemodify(bufname("%"), ':p:h') . '" && ' . s:path . 'package' . s:remove . s:roku_ip . ' -u ' . g:roku_username . ':' . g:roku_password . ' -p ' . g:roku_pkg_pass))
    echom join(s:result)
endfunc
