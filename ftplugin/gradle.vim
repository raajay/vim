" indent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent
set colorcolumn=80
set textwidth=79

" block indent
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>

" commenting
map // :s/^/\/\//<CR>
map \\ :s/^\/\///<CR>
