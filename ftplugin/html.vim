" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

filetype indent on
setlocal smartindent

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" enable tag jumping
runtime macros/matchit.vim
