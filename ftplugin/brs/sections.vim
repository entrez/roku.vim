func! s:NextSection(ending, backwards, visual)
    if a:visual
        norm! gv
    endif
    if a:ending
        let pattern = '\v\c^\s*end (function|sub)|%$'
    else
        let pattern = '\v\c^\s*(function|sub)>|%^'
    endif
    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    exec 'sil norm! ' . dir . pattern . "\r"
endfunc

noremap <script> <buffer> <silent> ]] :cal <SID>NextSection(0,0,0)<cr>
noremap <script> <buffer> <silent> [[ :cal <SID>NextSection(0,1,0)<cr>
noremap <script> <buffer> <silent> ][ :cal <SID>NextSection(1,0,0)<cr>
noremap <script> <buffer> <silent> [] :cal <SID>NextSection(1,1,0)<cr>

vnoremap <script> <buffer> <silent> ]] :<c-u>cal <SID>NextSection(0,0,1)<cr>
vnoremap <script> <buffer> <silent> [[ :<c-u>cal <SID>NextSection(0,1,1)<cr>
vnoremap <script> <buffer> <silent> ][ :<c-u>cal <SID>NextSection(1,0,1)<cr>
vnoremap <script> <buffer> <silent> [] :<c-u>cal <SID>NextSection(1,1,1)<cr>
