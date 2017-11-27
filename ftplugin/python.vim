" indent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

setlocal autoindent
setlocal nosmartindent
setlocal colorcolumn=79
setlocal textwidth=79

" block indent
map <buffer> > :s/^/\ \ \ \ /<CR>
map <buffer> < :s/^\ \ \ \ //<CR>

" commenting
map <buffer> // :s/^/#/<CR>
map <buffer> \\ :s/^\(\s*\)#/\1/<CR>

" run
map <F5> :!python "%:p"<CR>

" Jedi settings for code navigation
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>gd"
let g:jedi#usages_command = "<leader>fr"
let g:jedi#rename_command = "<leader>re"

map <buffer> <leader>pd <Esc>O"""<Esc>yypkA<CR>

nnoremap <leader>al <Esc>:ALELint<CR>
nnoremap <leader>ap <Esc>:ALEPreviousWrap<CR>
nnoremap <leader>an <Esc>:ALENextWrap<CR>

nnoremap <leader>re <Esc>:RopeRename<CR>
nnoremap <leader>gb <Esc>:RopeGotoDefinition<CR>

nnoremap <leader>fr <Esc>:YcmCompleter GoToReferences<CR>
nnoremap <leader>sd <Esc>:YcmCompleter GetDoc<CR>
