" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/\/\//<CR>
map <buffer> \\ :s/^\(\s*\)\/\//\1/<CR>

" Import under cursor
map <buffer> <leader>q <Esc>:ScalaImport<cr>
" Goto declaration
map <buffer> <leader>gd <Esc>:ScalaSearch<cr>

map <buffer> <leader>rr <Esc>:Validate<cr>
