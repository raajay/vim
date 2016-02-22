" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

setlocal autoindent
setlocal colorcolumn=80
setlocal textwidth=80

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/%/<CR>
map <buffer> \\ :s/^\(\s*\)%/\1/<CR>

let g:tex_isk='48-57,a-z,A-Z,192-255,:,-'

setlocal efm+=%E%f:%l:\ %m
