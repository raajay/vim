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
