" indent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent
set colorcolumn=79

" block indent
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>

" commenting
map // :s/^/#/<CR>
map \\ :s/^#//<CR>

" run
map <F5> :!python "%:p"<CR>

" auto complete
let g:SuperTabDefaultCompletionType = "context"

" Customized macros for Raajay
call IMAP('FUN',"def <++> (<+params+>):\n<++>\<CR>return <++>",'python')
call IMAP('SIF',"if (<+condition+>):\<CR><++>",'python')
call IMAP('SWH',"while (<+condition+>):\<CR><++>",'python')
