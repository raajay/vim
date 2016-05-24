" indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal softtabstop=2

setlocal autoindent
setlocal colorcolumn=80
setlocal textwidth=79
setlocal noautochdir

" block indent
map <buffer> > :s/^/\ \ /<CR>
map <buffer> < :s/^\ \ //<CR>

" commenting
map <buffer> // :s/^/\/\//<CR>
map <buffer> \\ :s/^\(\s*\)\/\//\1/<CR>

" run
map <buffer> <F5> :!javac "%:p"<CR> :!java "%:r"<CR>
set omnifunc=javacomplete#Complete
set completefunc=javacomplete#CompleteParamsInfo

" Syntax
"let java_highlight_functions=0
"let java_highlight_all=0
"let java_highlight_java_lang=0
"let java_highlight_java=0

" Goto declaration
map <buffer> <leader>gd <Esc>:JavaSearch -x declarations -i<cr>
" Goto implementation
map <buffer> <leader>gi <Esc>:JavaSearch -x implementors -i<cr>
" Find references
map <buffer> <leader>fr <Esc>:JavaSearch -x references -i<cr>
" Re-factor rename
map <buffer> <leader>re <Esc>:JavaRename<Space>
" Auto import package
map <buffer> <leader>pi <Esc>:JavaImport<cr>
" Format the source file
map <buffer> <leader>ff <Esc>:%JavaFormat<cr>

" new class
map <buffer> <leader>nc <Esc>:JavaNew class<Space>
" New interface
map <buffer> <leader>ni <Esc>:JavaNew @interface<Space>

" Implement method
map <buffer> <leader>im <Esc>:JavaImpl<cr>
" Create constructor
map <buffer> <leader>ic <Esc>:JavaConstructor<cr>
" Create get/set
map <buffer> <leader>is <Esc>:JavaGetSet<cr>
" create get
map <buffer> <leader>ig <Esc>:JavaGet<cr>

" List problems
map <buffer> <leader>el <Esc>:ProjectProblems<cr>


" Java debug configurations
let g:EclimJavaDebugLineHighlight='EclimDebugLine'
let g:EclimJavaDebugLineSignText='@'
let g:EclimJavaDebugStatusWinOrientation='vertical'
let g:EclimJavaDebugStatusWinWidth=80
let g:EclimJavaDebugStatusWinHeight=10

" Debug Start
map <buffer> <leader>dd <Esc>:JavaDebugStart localhost 1044<cr>
" Debug status
map <buffer> <leader>ds <Esc>:JavaDebugStatus<cr>
" Debug stop
map <buffer> <leader>dS <Esc>:JavaDebugStop<cr>

" Breakpoint toggle
map <buffer> <leader>bt <Esc>:JavaDebugBreakpointToggle<cr>
" Breakpoint delete / add as opposed to enable / disable
map <buffer> <leader>bd <Esc>:JavaDebugBreakpointToggle!<cr>
" Breakpoint list
map <buffer> <leader>bl <Esc>:JavaDebugBreakpointsList<cr>
" Break point remove from file
map <buffer> <leader>br <Esc>:JavaDebugBreakpointRemove<cr>
" Break point remove from entire project
map <buffer> <leader>bR <Esc>:JavaDebugBreakpointRemove!<cr>

" Step over break point
map <buffer> <leader>so <Esc>:JavaDebugStep over<cr>
" Step into break point
map <buffer> <leader>si <Esc>:JavaDebugStep into<cr>
" Step return
map <buffer> <leader>sr <Esc>:JavaDebugStep return<cr>

" Java doc add
map <buffer> <leader>ca <Esc>:JavaDocComment<cr>
" Java doc show
map <buffer> <leader>cs <Esc>:JavaDocPreview<cr>

" other misc
map <buffer> <leader>o <Esc>:Only<cr>
" organize
map <buffer> <leader>q <Esc>:JavaImportOrganize<cr>

" build
compiler gradle
map <buffer> <leader>rr <Plug>RooterChangeToRootDirectory<cr>:compiler gradle<cr>:make build<cr>
