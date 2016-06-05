" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

setlocal colorcolumn=80
setlocal textwidth=0
setlocal wrap
setlocal linebreak
setlocal nolist
setlocal breakindent

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/%%\ /<CR>
map <buffer> \\ :s/^\(\s*\)%%\ \(\s*\)/\1\2/<CR>

let g:tex_isk='48-57,a-z,A-Z,192-255,:,-'

setlocal efm+=%E%f:%l:\ %m
