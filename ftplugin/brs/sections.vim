func! s:GoToFunction(gotoend, backwards, visual)
    if a:visual
        norm! gv
    endif
    let pattern = a:gotoend ? '\v\c^\s*end (function|sub)|%$' : '\v\c^\s*(function|sub)>|%^'
    let dir = a:backwards ? '?' : '/'

    exec 'sil norm! ' . dir . pattern . "\r"
endfunc

noremap <script> <buffer> <silent> ]] :cal <SID>GoToFunction(0,0,0)<cr>
noremap <script> <buffer> <silent> [[ :cal <SID>GoToFunction(0,1,0)<cr>
noremap <script> <buffer> <silent> ][ :cal <SID>GoToFunction(1,0,0)<cr>
noremap <script> <buffer> <silent> [] :cal <SID>GoToFunction(1,1,0)<cr>

vnoremap <script> <buffer> <silent> ]] :<c-u>cal <SID>GoToFunction(0,0,1)<cr>
vnoremap <script> <buffer> <silent> [[ :<c-u>cal <SID>GoToFunction(0,1,1)<cr>
vnoremap <script> <buffer> <silent> ][ :<c-u>cal <SID>GoToFunction(1,0,1)<cr>
vnoremap <script> <buffer> <silent> [] :<c-u>cal <SID>GoToFunction(1,1,1)<cr>
