" indent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

setlocal autoindent
setlocal nosmartindent
setlocal colorcolumn=79
setlocal textwidth=79

" run
map <F5> :!python "%:p"<CR>

nnoremap <leader>gd <Esc>:YcmCompleter GoToDefinition<CR>
nnoremap <leader>fr <Esc>:YcmCompleter GoToReferences<CR>
nnoremap <leader>sd <Esc>:YcmCompleter GetDoc<CR>
