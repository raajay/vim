" Common Vim Settings"{{{
set nocompatible                    " do not force it to be vi compatible
set number                          " set line numbers
set relativenumber                  " relative line numbers are awesome.
set numberwidth=5                   " the number of columns for line numbers
set mouse=                          " disable mouse clicks for all modes
set backspace=eol,indent,start      " characters that backspace can erase
set wrap                            " do not wrap lines
set ruler                           " ruler format can be set; but I use vim-airline
set noerrorbells novisualbell t_vb= " I have no idea what to do here
au GUIEnter * set vb t_vb=          " Values get reset when GUI starts
set pastetoggle=<F2>                " disable indenting while pasting code
set hidden                          " allows us to move away from unsaved buffers
set noshowmatch                     " do not jump to matching brace
filetype plugin on                  " Detect filetype plugin and source them
filetype indent on                  " Indent based on filetypes
syntax on                           " Switch on syntax highlighting
set tabstop=4                       " One tab is 4 spaces
set shiftwidth=4                    " Indent to use 4 spaces
set expandtab                       " no more tabs; replace with spaces
set softtabstop=4                   " backspace can run over 4 spaces in one key press
set scrolloff=3                     " retain 3 lines for context while scrolling
set autoindent                      " automatically indent the files
set incsearch                       " search before we press enter for search
" set hlsearch                       " highlight search
set smartindent                     " removed since it interferes with python commenting
if exists('+colorcolumn')
    set colorcolumn=80              " highlights the 80th column
endif
set textwidth=0                     " no text width (moved to ft specific)
set cursorline                      " highlights the row the cursor is on
set cursorcolumn                    " highlights the current column
set lazyredraw                      " to speed up the effects of highlighting row or column
set laststatus=2                    " to display the status line always
set showtabline=2                   " to show the tab line always
set nospell                         " spell check, XXX where is the dictionary
set autochdir                       " change to the directory of the current file
set splitright                      " the new windows opens on the right
set splitbelow                      " horizontal split below
set encoding=utf-8
set termencoding=utf-8
set printoptions=number:y
set winaltkeys=no                   " disable use of alt keys for accessing gvim menus
set conceallevel=0
set concealcursor=""
set fo+=jn
"set clipboard=unnamed "interferes with regular yank
"set exrc
"set secure
set termguicolors
set undofile
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
""}}}
" My Custom Mappings (as opposed to plugins)
" My text folding settings"{{{
fu! CustomFoldText()
    let fs = v.foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
"set foldtext=CustomFoldText()
set foldtext=foldtext()
set foldmethod=marker
""}}}
" My color scheme configurations"{{{
let g:my_background=$BACKGROUND
let g:my_colorscheme=$COLORSCHEME
let g:my_airlinetheme=$AIRLINE_THEME

" configuring the defaults
if (g:my_background == '')
    let g:my_background='dark'
endif

if (g:my_colorscheme == '')
    let g:my_colorscheme='monokai'
endif

if (g:my_airlinetheme == '')
    let g:my_airlinetheme = 'airlineish'
endif

if(g:my_background == 'light')
    set background=light
else
    set background=dark
endif
let g:airline_theme=g:my_airlinetheme

hi Normal ctermbg=None
set t_Co=256
if(g:my_colorscheme == 'solarized')
    let g:solarized_termtrans=0
    let g:solarized_italic=1
    colorscheme solarized
elseif(g:my_colorscheme == 'monokai')
    colorscheme monokai2
endif

" Function to toggle between light and dark background
function! ToggleBG()
    if g:my_background=="light"
        let g:my_background="dark"
        set background=dark
    else
        let g:my_background="light"
        set background=light
    endif
    let g:airline_theme = g:my_airlinetheme
endfunc
map <leader>bg <Esc>:call ToggleBG()<cr>
""}}}
" gui Vim (gvim/macvim) - font/display settings"{{{
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline
    elseif has("gui_macvim")
        set antialias
        set guifont=Source\ Code\ Pro\ for\ Powerline:h11
    elseif has("gui_win32")
        set guifont=Consolas:h9:cANSI
    endif

    set guioptions-=m " removes the menu bar
    set guioptions-=T " removes the tool bar
    set guioptions-=L " removes the left scroll bar with Nerd Tree
    set guioptions-=r " removes the right scroll bar
    set guioptions-=e " removes the tab label
    set columns=120   " specifies the width of the GVim window
    set lines=120     " specifies the height of the GVim window
endif
""}}}
" Host specfic directory and config files"{{{
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "sansa"
    let g:vim_folder = "/scratch/raajay/vimfiles/"
elseif has('win32') || has('win64')
    let g:vim_folder = '~/vimfiles/'
else
    let g:vim_folder = '~/.vim/'
endif

" system specific settings
let g:vimrc = g:vim_folder . '_vimrc'
let g:local_vimrc = g:vim_folder . '_local_vimrc'
exec "set backupdir=".g:vim_folder."vimbackup//"
exec "set dir=".g:vim_folder."vimswap//"
exec "set undodir=".g:vim_folder."vimundo//"
"exec "source ".g:local_vimrc
"}}}
" Vim keyboard Shortcuts"{{{
let mapleader=$LEADER
if (mapleader == '')
    let mapleader=','
endif
" Show current highlight configuration command
map <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" mappings to avoid common mistakes in Vim
cnoreabbrev <expr> W getcmdtype() == ":" && getcmdline() == 'W' ? 'w' : 'W'
cnoreabbrev <expr> Q getcmdtype() == ":" && getcmdline() == 'Q' ? 'q' : 'Q'
" mappings to avoid going to command mode for common operations
vnoremap ; <Esc>:
nnoremap ; <Esc>:
vnoremap ;q :q<cr>
nnoremap ;q :q<cr>
vnoremap ;w :w<cr>
nnoremap ;w :w<cr>
vnoremap ;d :bd<cr>
nnoremap ;d :bd<cr>
vnoremap ;s :split<cr>
nnoremap ;s :split<cr>
vnoremap ;v :vsplit<cr>
nnoremap ;v :vsplit<cr>
" Build / Compile related (requires a Makefile)
vnoremap <leader>w :make!<cr>
nnoremap <leader>w :make!<cr>
" C-y copies to global buffer, copying across applications
nnoremap <C-y> "+y
vnoremap <C-y> "+y
" C-l pastes from the global buffer
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
inoremap <C-p> <Esc>"+gP
" Space moves current cursor location to center of screen
nmap <space> zz
nnoremap n nzz
nnoremap N Nzz
" Block indentation (can be overridden in ftplugins)
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>
" push vim to the background and give shell access
map <leader>q <Esc><c-z>
" edit vimrc
map <leader>ev <Esc>:edit $MYVIMRC<cr>
" source vimrc
map <leader>sv <Esc>:source $MYVIMRC<cr>
" edit bash
map <leader>eb <Esc>:edit ~/.bashrc<cr>

" toggle relative numbers
map <leader>rn :set relativenumber!<cr>
" remove trailing characters
map <leader>tr <Esc>:%s/\ *$//g<cr><c-o>
" replace tabs with 4 spaces
map <leader>rt4 <Esc>:%s/\t/\ \ \ \ /g<cr><c-o>
" replace tabs with 2 spaces
map <leader>rt2 <Esc>:%s/\t/\ \ /g<cr><c-o>
" reload file
map <leader>re <Esc>:redraw!<cr>
" Jump to the first window (leftmost)
map <C-1> <C-w>200h
" Jump to the last window (rightmost)
map <C-\> <C-w>200l
" Show the TODO / WISH list
" works only with silver searcher plugin
nnoremap <leader>dd <Esc>:Ag "TODO.*\(raajay\)"<CR>
nnoremap <leader>ee <Esc>:Ag "XXX.*\(raajay\)"<CR>

" Function to toggle the to-do list"{{{
let g:open_todo = 0
function! OpenToDo()
    if g:open_todo == 0
        let g:open_todo = 1
        :vsplit ~/Dropbox/todo/todo.txt
    elseif g:open_todo == 1
        let g:open_todo = 0
        :bdelete ~/Dropbox/todo/todo.txt
    endif
endfunc
map <leader>a <Esc>:call OpenToDo()<cr>
""}}}
" Spelling toggle "{{{
let g:my_spell=1
function! ToggleSpell()
    if g:my_spell==0
        setlocal nospell
        let g:my_spell=1
    else
        setlocal spell spelllang=en_us
        let g:my_spell=0
    endif
endfunc
map <leader>sp <Esc>:call ToggleSpell()<cr>
""}}}
""}}}
" Vim keyword mappings"{{{
inoremap TODO TODO(raajay):<Space>
inoremap XXX XXX(raajay):<Space>
" insert data at current location
iab <expr> ddt strftime("%e-%b-%Y %H:%M")
"}}}
" Filetype detection"{{{
if has("autocmd")
    autocmd BufRead,BufNewFile *.tex set ft=tex
    autocmd BufRead,BufNewFile *.gms set ft=gams
    autocmd BufRead,BufNewFile *.xtx set ft=xtx
    autocmd BufRead,BufNewFile *.lst set ft=lst
    autocmd BufRead,BufNewFile *.gradle set ft=groovy
    autocmd BufRead,BufNewFile *.md set ft=markdown
    autocmd BufRead,BufNewFile *.scala set ft=scala
    autocmd BufRead,BufNewFile _bash* set ft=sh
    autocmd BufRead,BufNewFile *.mutt set ft=muttrc
    autocmd BufRead,BufNewFile *conf set ft=conf
    autocmd BufRead,BufNewFile *.yml set ft=ansible
    autocmd BufRead,BufNewFile *.todo set ft=todo
endif
""}}}
" Vim niceties (write with sudo, autosave, remember last pos, etc..)"{{{
" Remembering the previous edits - this is a gem
set viminfo='10,\"100,:20,%,n~/.viminfo
" Remembering the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif
" Auto save
if has("autocmd")
    au BufLeave,FocusLost * :update
endif
" auto header insert
if has("autocmd")
    autocmd BufNewFile *.sh 0r $HOME/.vim/templates/sh.template
endif
" Sudo write
cnoremap sudow w !sudo tee % > /dev/null
" Number lines visually selected
command -range=% -nargs=? Number :<line1>,<line2>s/^/\=printf("%d<args>", line(".") - line("'<") + 1)
" Take a backup of a file
command! Bak :w %.bak
"}}}
" time out settings for redrawing the screen"{{{
set timeoutlen=3000
set ttimeoutlen=50
set updatetime=30 " time taken by bufferline to redraw
"}}}
" vim grep settings"{{{
set grepprg=grep\ -nH\ $*
" The Silver Searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif
"}}}
" quickfix and location list{{{
nnoremap <leader>co <Esc>:copen<CR>
nnoremap ]q <Esc>:cnext<CR>
nnoremap [q <Esc>:cprevious<CR>
" moves the quick fix list to the bottom. Upon entering the 'qf' filetye
" execut the command to move a window to the bottom
autocmd FileType qf wincmd J

nnoremap <leader>lo <Esc>:lopen<CR>
nnoremap <leader>lp <Esc>:lprevious<CR>
nnoremap <leader>ln <Esc>:lnext<CR>

autocmd QuickFixCmdPost *grep* cwindow
""}}}
" buffer, tab and pane settings{{{
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab h' : 'h'
"}}}
" syntax settings {{{
autocmd Syntax * syntax keyword Todo NOTE WISH containedin=.*Comment
"}}}
" PLUGIN SETTINGS (installed via pathogen)
" vim-airline settings"{{{
let g:airline_section_b = '%{pathshorten(getcwd())."  ".airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_c = '%{pathshorten(expand("%:p"))}' " full file name
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z', 'error', 'warning']
      \ ]

" vim-airline-symbols
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

" Power line symbols - just used for separation
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Not sure what exactly happens in the next command. It is possible that the
" entire section is removed if window width is less than 20
"let g:airline#extensions#default#section_truncate_width = { 'c' : 20 }
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'VB',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
""}}}
" vim-airline-tabline settings"{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1       " show buffers in the tabline
let g:airline#extensions#tabline#tab_nr_type = 2        " splits and tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1    " allow navigation using hot keys
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
" mappings to use for selecting buffers
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#bufferline#overwrite_variables = 0

let g:airline#extensions#whitespace#trailing_format = 'tr[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mi[%s]'
""}}}
" NERDTree settings"{{{
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tabs = 0
let g:nerdtree_tabs_autoclose = 1
let NERDTreeAutoCenterThreshold=999
let NERDTreeHijackNetrw = 0
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowLineNumbers = 0
"let NERDTreeDirArrowExpandable="+"
"let NERDTreeDirArrowCollapsible="-"
let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.sln$', '\.suo$', '\.swp$']
let NERDTreeRespectWildIgnore = 1
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 36
map <leader>ss <Esc>:NERDTreeToggle<CR>
""}}}
"super tab settings"{{{
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-p>'
""}}}
" Command-T settings"{{{,*/third_party/*
if has('win32') || has('win64')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.class,*.pyc
else
    set wildignore+=*/tmp/*,*.so,*.zip,*.swp,*.class,*.pyc,*/bin/*,*/project/*,*/target/*,*/.git/*,*/third_party/*,*.o,*.out,*.JPEG,*.tar,*.tar.gz
endif
let g:CommandTMaxDepth = 20
let g:CommandTMaxHeight = 20
let g:CommandTMatchWindowReverse = 1
let g:CommandTTraverseSCM='pwd'
map <leader>ff <Esc>:CommandT<CR>
map <leader>fj <Esc>:CommandTJump<CR>
""}}}
" YouCompleteMe settings"{{{
" disabling it since configuration should be done per project
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_warning_symbol = '>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_disable_for_files_larger_than_kb = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_server_keep_logfiles = 1
let g:ycm_path_to_python_interpreter=substitute(system('which python'), '\n', '', '')
"let g:ycm_path_to_python_interpreter='/usr/bin/python'
if(hostname() == "dove.cs.wisc.edu")
    let g:clang_library_path="/unsup/llvm-3.3/lib"
endif
let g:ycm_filetype_blacklist = {
            \}
let g:ycm_cache_omnifunc=1
let g:ycm_filetype_blacklist = {
    \ 'go' : 1
    \}
""}}}
" Eclim settings"{{{
let g:EclimCompletionMethod='omnifunc'
" Eclim - Scala settings
let g:EclimScalaValidate=1
""}}}
" Delimitmate settings"{{{
let delimitMate_expand_cr = 1
""}}}
" vim-rooter settings"{{{
"let g:rooter_autocmd_patterns = '*.java,*.tex,*vimrc,*.vim'
let g:rooter_patterns = [
    \ '_vimrc_',
    \ '.localvimrc',
    \ '.main',
    \ '.gradlemain',
    \ '.latexmain',
    \ '.htmlmain',
    \ 'pom.xml',
    \ 'build.xml',
    \ 'build.sbt',
    \ '.git',
    \ '.git/',
    \ '__init__.py'
    \ ]
let g:rooter_use_lcd = 1
"let g:rooter_manual_only = 1
""}}}
"vim-snippets settings"{{{
let g:snips_author="Raajay Viswanathan"
let g:snips_email="raajay.v@gmail.com"
let g:snips_github="https://github.com/raajay"
let g:pybin = substitute(system('which python'), '\n', '', '')
""}}}
" UltiSnips settings"{{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
""}}}
" vim-gitgutter settings"{{{
let g:gitgutter_map_keys = 0
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterRevertHunk
nmap <leader>hd <Plug>GitGutterPreviewHunk
nmap <leader>hh <Plug>GitGutterNextHunk
nmap <leader>hp <Plug>GitGutterPrevHunk
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
""}}}
" vim-fugitive settings"{{{
nmap <leader>gs <Esc>:Gstatus<CR>
nmap <leader>gc <Esc>:Gcommit -m<Space>""<left>
nmap <leader>gp <Esc>:Gpush<CR>
nmap <leader>gl <Esc>:Glog -n 10 --<CR>
set previewheight=30
" make the status window the bottom most one
autocmd FileType gitcommit wincmd J
""}}}
" vimtex settings"{{{
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
" set fillchars " set based on advice from vimtex plugin
"set foldcolumn=2
"let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1
let g:vimtex_fold_comments=1
let g:vimtex_fold_preamble=0
let g:vimtex_fold_sections = [
            \ "section",
            \ "subsection",
            \ ]

let g:ycm_semantic_triggers.tex = [
            \ 're!\\ref{',
            \ 're!\\xref{',
            \ 're!\\Cref{',
            \ 're!\\cref{',
            \ 're!\\cite{',
            \ 're!\\includegraphics{',
            \ 're!\\include{',
            \ 're!\\input{',
            \ ]
""}}}
" indentLine settings"{{{
let g:indentLine_enabled=1
let g:indentLine_color_term = 237
let g:indentLine_concealcursor=''
let g:indentLine_conceallevel=0
map <leader>il <Esc>:IndentLinesToggle<cr>
""}}}
" vim-go settings"{{{
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 0
let g:go_highlight_structs = 1
let g:ycm_semantic_triggers.go = ['.']
""}}}
" Vim session settings"{{{
let g:session_autosave='no'
""}}}
" goyo.vim settings"{{{
"let g:goyo_width=120
"let g:goyo_height=60
map <leader>z <Esc>:Goyo 80x40<CR>
""}}}
" NERDCommenter"{{{
"map <leader>// <Esc>:NERDComComment<CR>
let g:NERDSpaceDelims=1
""}}}
" vim-mru settings"{{{
"map <leader>ls <Esc>:MRU<CR>
""}}}
" vim-buffergator settings"{{{
let g:buffergator_suppress_keymaps=1
let g:buffergator_show_full_directory_path=0
let g:buffergator_viewport_split_policy='B'
map <leader>lb <Esc>:BuffergatorOpen<CR>
map <leader>ls <Esc>:BuffergatorOpen<CR>
map <leader>lt <Esc>:BuffergatorTabsOpen<CR>
map <leader>lr <Esc>:BuffergatorMruList<CR>
""}}}
" vim-pencil settings"{{{
let g:pencil#conceallevel=0
""}}}
" vim-cpp-enhanced-highlight"{{{
" note the file are in build/syntax
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
""}}}
" vim-tagbar settings"{{{
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'tex',
    \ 'kinds' : [
    \ 's:sections',
    \ 'g:graphics:0:0',
    \ 'l:labels',
    \ 'r:refs:1:0',
    \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort' : 0,
    \ }
" open and jump to tagbar, if already open jump to tagbar
map <leader>aa <Esc>:TagbarToggle<CR>
map <leader>aj <Esc>:TagbarOpen j<CR>
let g:tagbar_left = 1
let g:tagbar_autoclose = 0
""}}}
" vim-rtags"{{{
let g:rtagsUseDefaultMappings = 0
" All the key mappings are defined in ftplugin/cpp.vim
""}}}
" ALE lint settings "{{{
let g:ale_lint_on_text_changed='never'
let g:ale_lint_delay=1000
let g:ale_linters = {
    \   'cpp' : ['cpplint'],
    \}
"}}}
" ropevim settings "{{{
let ropevim_vim_completion=1
let ropevim_extended_complete=1
"}}}
" SimpylFold settings "{{{
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_fold_import=0
"}}}
" vim-alternate settings "{{{
nnoremap ;a <Esc>:AlternateVSplit<CR>
vnoremap ;a <Esc>:AlternateVSplit<CR>
nnoremap ;A <Esc>:AlternateSplit<CR>
vnoremap ;A <Esc>:AlternateSplit<CR>
"}}}
" Misc settings"{{{
" Tabularize - Helps in alignment
map <leader>b <Esc>:Tabularize<Space>
" Navigation Settings
map <leader>pp <Esc><c-w><c-p>
""}}}
" Pathogen settings"{{{
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'ale')
call add(g:pathogen_disabled, 'color_coded')
call add(g:pathogen_disabled, 'vim-gtags-cscope')
call add(g:pathogen_disabled, 'tabular')
call add(g:pathogen_disabled, 'tasklist')
call add(g:pathogen_disabled, 'vim-ansible')
call add(g:pathogen_disabled, 'vim-gtags')
call add(g:pathogen_disabled, 'vim-gtags-cscope')
call add(g:pathogen_disabled, 'vim-gundo')
call add(g:pathogen_disabled, 'vim-mru')
call add(g:pathogen_disabled, 'vim-multiple-cursors')
call add(g:pathogen_disabled, 'vim-pencil')
call add(g:pathogen_disabled, 'vim-session')
call add(g:pathogen_disabled, 'vim-shell')
call add(g:pathogen_disabled, 'vimtex')
call add(g:pathogen_disabled, 'vim-wordy')

if has('win32') || has('win64')
    call add(g:pathogen_disabled, 'YouCompleteMe')
end
if (executable('global') == 0)
    call add(g:pathogen_disabled, 'vim-gtags-cscope')
endif
""}}}
" Source private VIMRC
if !empty(glob("~/_vimrc_private"))
    source ~/_vimrc_private
endif
" Source local VIMRC
if !empty(glob(".localvimrc"))
    source .localvimrc
endif
call pathogen#infect()
call pathogen#helptags()

let g:vimspectrCursorLineNr = 'off'
let g:vimspectrLineNr = 'on'
colorscheme vimspectrgrey-dark
