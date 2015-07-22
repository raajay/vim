" indent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal textwidth=79

setlocal autoindent
setlocal colorcolumn=80

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/\/\//<CR>
map <buffer> \\ :s/^\(\s*\)\/\//\1/<CR>
