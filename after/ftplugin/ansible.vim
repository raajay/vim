
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

setlocal autoindent
setlocal colorcolumn=80
setlocal textwidth=79
setlocal noautochdir

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/#/<CR>
map <buffer> \\ :s/^\(\s*\)#/\1/<CR>
