" indent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set autoindent
set colorcolumn=80

" block indent
map > :s/^/\ \ /<CR>
map < :s/^\ \ //<CR>

" commenting
map // :s/^/\/\//<CR>
map \\ :s/^\/\///<CR>

" make syntastic go into passive mode
":SyntasticToggleMode
