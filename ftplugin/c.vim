" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2
setlocal textwidth=79

setlocal autoindent
setlocal colorcolumn=80

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/\/\//<CR>
map <buffer> \\ :s/^\(\s*\)\/\//\1/<CR>

" Code navigation with clang-complete (YCM)
nnoremap <leader>gi <Esc>:YcmCompleter GoToInclude<CR>
nnoremap <leader>gd <Esc>:YcmCompleter GoToDefinition<CR>
nnoremap <leader>ge <Esc>:YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gt <Esc>:YcmCompleter GetType<CR>
nnoremap <leader>gp <Esc>:YcmCompleter GetParent<CR>
nnoremap <leader>sd <Esc>:YcmCompleter GetDoc<CR>

" Code navigation with gtags-csope
"nnoremap <leader>fr <Esc>:cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fr <Esc>:Gtags -r <C-R>=expand("<cword>")<CR><CR>
"nnoremap <leader>fd <Esc>:cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fd <Esc>:GtagsCursor<CR>
nnoremap <leader>gl <Esc>:Gozilla<CR>
