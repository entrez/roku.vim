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

    let target_devices = a:0 > 0 ? a:000 : type(g:roku_ip) == 3 ? g:roku_ip : [ g:roku_ip ]
    let increment = exists('g:roku_increment_buildno') && g:roku_increment_buildno == 1
                \ ? '--increment' : ''

    for roku_ip in target_devices
        echoh Normal | echom 'compressing channel & uploading to roku (' . roku_ip . ')'
        let result = split(system(s:path . 'install "' . bufname('%') . '" ' . 
                    \ increment . ' -u ' . g:roku_username . ':' . g:roku_password .
                    \ ' -d ' . roku_ip), '\n')
        echom join(result)
    endfor
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

    let target_devices = a:0 > 0 ? a:000 : type(g:roku_ip) == 3 ? g:roku_ip : [ g:roku_ip ]
    let remove = !exists('g:roku_remove_old') || g:roku_remove_old ? ' --remove-old ' : ' '
    let target_devices = remove == ' ' ? target_devices : target_devices[:0]

    for roku_ip in target_devices
        echoh Normal | echom 'packaging channel'
        let result = split(system('cd "' . fnamemodify(bufname("%"), ':p:h') . '" && ' . s:path . 
                    \ 'package' . remove . roku_ip . 
                    \ ' -u ' . g:roku_username . ':' . g:roku_password . 
                    \ ' -p ' . g:roku_pkg_pass))
        echom join(result)
    endfor
endfunc
