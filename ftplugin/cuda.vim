" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2
setlocal textwidth=79

setlocal autoindent
setlocal colorcolumn=80

" vim-rtags settings
map <leader>rd <Esc>:call rtags#Diagnostics()<CR>
map <leader>rc <Esc>:call rtags#FindSubClasses()<CR>
map <leader>rC <Esc>:call rtags#FindSuperClasses()<CR>
map <leader>rb <Esc>:call rtags#JumpBack()<CR>
map <leader>rv <Esc>:call rtags#FindVirtuals()<CR>
map <leader>re <Esc>:call rtags#RenameSymbolUnderCursor()<CR>
map <leader>rl <Esc>:call rtags#ProjectList()<CR>
map <leader>rr <Esc>:call rtags#ReindexFile()<CR>
map <leader>rs <Esc>:call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
map <leader>rf <Esc>:call rtags#FindRefs()<CR>
map <leader>rp <Esc>:call rtags#JumpToParent()<CR>
map <leader>rT <Esc>:call rtags#JumpTo(g:NEW_TAB)<CR>
map <leader>rV <Esc>:call rtags#JumpTo(g:V_SPLIT)<CR>
map <leader>rS <Esc>:call rtags#JumpTo(g:H_SPLIT)<CR>
map <leader>rJ <Esc>:call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
map <leader>rj <Esc>:call rtags#JumpTo(g:SAME_WINDOW)<CR>
map <leader>ri <Esc>:call rtags#SymbolInfo()<CR>
