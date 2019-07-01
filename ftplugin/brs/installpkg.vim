let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h:h') . '/roku_scripts/'

func! RokuInstall()
    if !exists('g:roku_ip')
        echoe 'missing valid hostname or ip - set g:roku_ip'
        return
    elseif !exists('g:roku_username')
        echoe 'missing device username - set g:roku_username'
        return
    elseif !exists('g:roku_password')
        echoe 'missing device password - set g:roku_password'
        return
    endif

    echom 'compressing & sending channel to ' . g:roku_ip
    let s:result = split(system(s:path . 'install "' . bufname('%') . '" -u ' . g:roku_username . ':' . g:roku_password .
                \ ' -d ' . g:roku_ip), '\n')
    echom join(s:result)
endfunc

func! RokuPackage()
    if !exists('g:roku_ip')
        echoe 'missing valid hostname or ip - set g:roku_ip'
        return
    elseif !exists('g:roku_pkg_pass')
        echoe 'missing packaging password - set g:roku_pkg_pass'
        return
    elseif !exists('g:roku_username')
        echoe 'missing device username - set g:roku_username'
        return
    elseif !exists('g:roku_password')
        echoe 'missing device password - set g:roku_password'
        return
    endif

    if !exists('g:roku_remove_old_pkg')
        let s:remove = ' --remove-old '
    else
        if g:roku_remove_old
            let s:remove = ' --remove-old '
        else
            let s:remove = ' '
        endif
    endif

    echom 'packaging channel'
    let s:result = split(system('cd "' . fnamemodify(bufname("%"), ':p:h') . '" && ' . s:path . 'package' . s:remove . g:roku_ip . ' -u ' . g:roku_username . ':' . g:roku_password . ' -p ' . g:roku_pkg_pass))
    echom join(s:result)
endfunc

nnoremap <buffer> <leader>; :call RokuInstall()<cr>
nnoremap <buffer> <leader>' :call RokuPackage()<cr>
