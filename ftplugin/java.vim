" indent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent
set colorcolumn=80

" block indent
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>

" commenting
map // :s/^/\/\//<CR>
map \\ :s/^\/\///<CR>

" run
map <F5> :!javac "%:p"<CR> :!java "%:r"<CR>
set omnifunc=javacomplete#Complete
set completefunc=javacomplete#CompleteParamsInfo

map <leader>gd <Esc>:JavaSearch<cr>         " Search for the pattern under the cursor
map <leader>fmt <Esc>:JavaFormat<cr>        " Format the source file
map <leader>jd <Esc>:JavaDocComment<cr>     " Create/Update java doc comment for the element under the cursor
map <leader>rr <Esc>:Java<cr>               " Run the main class
map <leader>ji <Esc>:JavaImport<cr>
