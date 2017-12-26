" File:        ftplugin/todo.vim
" Version:     1.0
" Description: This plugin defines command for todo files
" Maintainer:  Raajay Viswanathan (raajay.v@gmail.com)
" Manual:      Read ":help todo".
" ============================================================================

" Initialization: {{{
if exists("g:loaded_vim_todo")
    finish
endif
let g:loaded_vim_todo = 1
"}}}

" Commands: {{{
"command! -bar TodoOpenNew call
command! -bar TodoClose :s/^.\ /x\ /g
command! -bar TodoWorking :s/^.\ /w\ /g
command! -bar TodoOpen :s/^.\ /o\ /g
"}}}

" Keyword mappings: {{{
nnoremap ;tx <Esc>:TodoClose<CR>:w<CR>
nnoremap ;to <Esc>:TodoOpen<CR>:w<CR>
nnoremap ;tw <Esc>:TodoWorking<CR>:w<CR>
"}}}
