autocmd BufNewFile,BufRead *.brs setfiletype brs

autocmd BufNewFile,BufRead manifest call s:RokuCheck() 
autocmd BufNewFile,BufRead *.brs call s:RokuCheck() 
autocmd BufNewFile,BufRead *.xml call s:RokuCheck() 

fun! s:RokuCheck()
    if glob(fnamemodify(bufname('%'), ':p:h') . '/source/*.brs') != '' || glob(fnamemodify(bufname('%'), ':p:h') . '*.brs') != ''
        nnoremap <buffer> <leader>; :call installpkg#RokuInstall()<cr>
        nnoremap <buffer> <leader>' :call installpkg#RokuPackage()<cr>
    endif
endfun

" vim:et:sw=4:ts=4
