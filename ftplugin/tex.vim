" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

setlocal spell                   " spell check, XXX where is the dictionary
setlocal spelllang=en

setlocal colorcolumn=80
setlocal textwidth=79

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/%%\ /<CR>
map <buffer> \\ :s/^\(\s*\)%%\ \(\s*\)/\1\2/<CR>

let g:tex_isk='48-57,a-z,A-Z,192-255,:,-'

setlocal efm+=%E%f:%l:\ %m
