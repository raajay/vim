" indent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent
set colorcolumn=80
set textwidth=79
set noautochdir

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

" Goto declaration
map <leader>gd <Esc>:JavaSearch -x declarations -i<cr>
" Goto implementation
map <leader>gi <Esc>:JavaSearch -x implementors -i<cr>
" Find references
map <leader>fr <Esc>:JavaSearch -x references -i<cr>
" Re-factor rename
map <leader>rn <Esc>:JavaRename<Space>
" Auto import package
map <leader>pi <Esc>:JavaImport<cr>
" Format the source file
map <leader>fm <Esc>:%JavaFormat<cr> 

" new class
map <leader>nc <Esc>:JavaNew class<Space>
" New interface
map <leader>ni <Esc>:JavaNew @interface<Space>

" Implement method
map <leader>im <Esc>:JavaImpl<cr>
" Create constructor
map <leader>ic <Esc>:JavaConstructor<cr>
" Create get/set
map <leader>is <Esc>:JavaGetSet<cr>
" create get
map <leader>ig <Esc>:JavaGet<cr>

" List problems 
map <leader>el <Esc>:ProjectProblems<cr>

" Debug Start
map <leader>dd <Esc>:JavaDebugStart localhost 5005<cr>
" Debug status
map <leader>ds <Esc>:JavaDebugStatus<cr>

" Breakpoint toggle
map <leader>bt <Esc>:JavaDebugBreakpointToggle<cr>
" Breakpoint delete 
map <leader>bd <Esc>:JavaDebugBreakpointToggle!<cr>
" Breakpoint list
map <leader>bl <Esc>:JavaDebugBreakpointsList<cr>
" Break point remove from file
map <leader>br <Esc>:JavaDebugBreakpointRemove<cr>
" Break point remove from entire project
map <leader>bR <Esc>:JavaDebugBreakpointRemove!<cr>

" Step over break point
map <leader>so <Esc>:JavaDebugStep over<cr>
" Step into break point
map <leader>si <Esc>:JavaDebugStep into<cr>
" Step return
map <leader>sr <Esc>:JavaDebugStep return<cr>

" Java doc add
map <leader>ca <Esc>:JavaDocComment<cr>
" Java doc show
map <leader>cs <Esc>:JavaDocPreview<cr>

" other misc
map <leader>o <Esc>:Only<cr>
" organize
map <leader>q <Esc>:JavaImportOrganize<cr>

" build
compiler gradle
map <leader>rr <Plug>RooterChangeToRootDirectory<cr>:compiler gradle<cr>:make build<cr>


" control p
let g:ctrlp_root_markers = ['build.gradle']
