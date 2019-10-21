" Vim is the editor I am most comfortable with. Over the years, I have tried
" different editors including Sublime Text, Emacs (with Spacemacs), Atom,
" Notepad++. Each of these editors are great with amazing functionality, which
" is the reason I even tried them in the first place. For example, when I
" started using Mac I tried Sublime Text; it was super easy to use editor with
" an amazing user interface. I liked how easy it is to manage packages,
" projects, etc..
"
" However, during times of power use (like paper deadlines), I
" find myself missing the comfort of Vim and would give up on the current
" editor I am testing out. Perhaps, if I continued using alternate editors, I
" would get comfortable using them. But for now, I think I am stuck with Vim
" :)
"
" <Pluging usage vs features with native support>
"
" I go the idea to create tags for navigating the vimrc from this
" (http://ifacethoughts.net/2008/05/02/vim-as-a-personal-wiki/) article.
" I learnt how to configure Exuberant Ctags to create custom tags file from
" here: http://ctags.sourceforge.net/EXTENDING.html
"
" Index                                 *vimrc-index*
" 1. Common Vim Settings                |common-settings|
" 2. Colorscheme Settings               |color-settings|
" 3. GUI Settings                       |gui-settings|
" 4. Host parameters                    |host-params|
" 5. Files and folders                  |files-folders|
" 6. Leader key                         |vimrc-leader|
" x. Filetype detection                 |vimrc-ft-detect|
" x. Custom function definitions        |vimrc-functions|
" x. Custom Ex commands                 |vimrc-custom-commands|
" x. Custom key mappings                |vimrc-custom-mappings|
" x. Vim timeout settings               |vimrc-timeout|
" x. Vim grep settings                  |vimrc-grep|

" Common Vim Settings   *common-settings*   |vimrc-index| "{{{
set nocompatible                    " do not force it to be vi compatible
set number                          " set line numbers
set relativenumber                  " relative line numbers are awesome.
set numberwidth=5                   " the number of columns for line numbers
set mouse=a                         " enable mouse clicks for all modes
set backspace=eol,indent,start      " characters that backspace can erase
set wrap                            " wrap lines
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
set nohlsearch                      " do not highlight all matching terms
set smartindent                     " auto indent
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
set undofile
set foldmethod=marker
set iskeyword+=-                    " Can select hyphenated words
""}}}

" Time out settings for redrawing the screen    *vimrc-timeout* |vimrc-index|   "{{{
set timeoutlen=3000
set ttimeoutlen=50
set updatetime=30       " time taken by bufferline to redraw
"}}}

" Vim grep settings *vimrc-grep*    |vimrc-index|   "{{{
set grepprg=grep\ -nH\ $*
" The Silver Searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif
"}}}

" My color scheme configurations    *color-settings*    |vimrc-index|   "{{{
let g:wwdc17_frame_color=10
let g:wwdc17_transp_bg=0
if $ITERM_PROFILE == 'white'
    set background=light
    colorscheme rj_white
else
    set background=dark
    colorscheme monokai2
endif
let g:airline_theme='airlineish'
""}}}

" Vim leader setting    *vimrc-leader*  |vimrc-index|  "{{{
let mapleader=$LEADER
if (mapleader == '')
    let mapleader=','
endif
"}}}

" Quick fix and location list   *vimrc-quickfix*    |vimrc-quickfix|    "{{{
nnoremap <leader>co <Esc>:copen<CR>
nnoremap ]q <Esc>:cnext<CR>
nnoremap [q <Esc>:cprevious<CR>

nnoremap <leader>lo <Esc>:lopen<CR>
nnoremap <leader>lp <Esc>:lprevious<CR>
nnoremap <leader>ln <Esc>:lnext<CR>

" moves the quick fix list to the bottom. Upon entering the 'qf' file type
" execute the command to move a window to the bottom
autocmd FileType qf wincmd J
autocmd QuickFixCmdPost *grep* cwindow
""}}}

" GUI vim (gvim/macvim) *gui-settings*  |vimrc-index|   "{{{
if has("gui_running")
    source ~/.vim/_gui_vimrc
endif
""}}}

" Host parameters   *host-params*   |vimrc-index|   "{{{
let hostname = substitute(system('hostname'), '\n', '', '')
"}}}

" Files and Folders *files-folders* |vimrc-index| "{{{
if has('win32') || has('win64')
    let g:vim_folder = '~/vimfiles/'
else
    let g:vim_folder = '~/.vim/'
endif
let g:vimrc = g:vim_folder . '_vimrc'
let g:local_vimrc = g:vim_folder . '_local_vimrc'
exec "set backupdir=".g:vim_folder."vimbackup//"
exec "set dir=".g:vim_folder."vimswap//"
exec "set undodir=".g:vim_folder."vimundo//"
"}}}

" Vim custom command line mappings  *vimrc-custom-commands* |vimrc-index|    "{{{
" Show current highlight configuration command
map <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Commands to avoid common mistakes in Vim
cnoreabbrev <expr> W getcmdtype() == ":" && getcmdline() == 'W' ? 'w' : 'W'
cnoreabbrev <expr> Q getcmdtype() == ":" && getcmdline() == 'Q' ? 'q' : 'Q'
" Help
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab h' : 'h'
" Sudo write
cnoremap sudow w !sudo tee % > /dev/null
" Number lines visually selected
command -range=% -nargs=? Number :<line1>,<line2>s/^/\=printf("%d<args>", line(".") - line("'<") + 1)
" Insert mode mapping
inoremap TODO TODO(raajay):<Space>
inoremap XXX XXX(raajay):<Space>
" Insert date at current location
iab <expr> mydate strftime("%e-%b-%Y %H:%M")
""}}}

" Vim custom key mappings   *vimrc-custom-mappings* |vimrc-index|   "{{{

" mappings to avoid going to command mode for common operations
vnoremap <unique> ; <Esc>:
nnoremap <unique> ;; <Esc>:
nnoremap <unique> ;q :q<cr>
nnoremap <unique> ;w :w<cr>
nnoremap <unique> ;d :bd<cr>
nnoremap <unique> ;s :split<cr>
nnoremap <unique> ;v :vsplit<cr>
" Build / Compile related (requires a Makefile)
nnoremap <unique> <leader>w :make!<cr>
" C-y copies to global buffer, copying across applications
nnoremap <unique> <C-y> "+y
vnoremap <unique> <C-y> "+y
" C-p pastes from the global buffer
nnoremap <unique> <C-p> "+gP
vnoremap <unique> <C-p> "+gP
inoremap <unique> <C-p> <Esc>"+gP
" Space moves current cursor location to center of screen
nnoremap <unique> <space> zz
nnoremap <unique> n nzz
nnoremap <unique> N Nzz
" Line navigation mappings
nnoremap <unique> gh ^
nnoremap <unique> gl $
nnoremap <unique> gk gg
nnoremap <unique> gj G
" Block indentation (<, > are native vim commands). Shifts by shiftwidth chrs.
xnoremap <unique> > >gv
xnoremap <unique> < <gv
" push vim to the background and give shell access
noremap <unique> <leader>q <Esc><c-z>
" edit vimrc
noremap <unique> <leader>ev <Esc>:edit $MYVIMRC<cr>
" source vimrc
noremap <unique> <leader>sv <Esc>:source $MYVIMRC<cr>
" toggle relative numbers
noremap <unique> <leader>rn :set relativenumber!<cr>
" remove trailing characters
noremap <unique> <leader>tr <Esc>:%s/\ *$//g<cr><c-o>
" reload file
noremap <unique> <leader>re <Esc>:redraw!<cr>
" jump to the first window (leftmost)
noremap <unique> <C-1> <C-w>200h
" jump to the last window (rightmost)
noremap <unique> <C-\> <C-w>200l
" show the TODO / WISH list (works only with silver searcher plugin)
nnoremap <unique> <leader>dd <Esc>:Ag "TODO.*\(raajay\)"<CR>
nnoremap <unique> <leader>ee <Esc>:Ag "XXX.*\(raajay\)"<CR>
""}}}

" Custom function defs  *vimrc-functions*   |vimrc-index|   "{{{
""}}}

" Filetype detection    *vimrc-ft-detect*   |vimrc-index|  "{{{
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

" Vim niceties  *vimrc-niceties*    |vimrc-index|   "{{{

" Remembering the previous edits
if !has('nvim')
    set viminfo='10,\"100,:20,%,n~/.viminfo
endif

" Remembering the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif

" Auto save
if has("autocmd")
    au BufLeave,FocusLost * :update
endif

"}}}

" File templates    *vimrc-templates*   |vimrc-index|   "{{{

" Auto header insert for shell files
if has("autocmd")
    autocmd BufNewFile *.sh 0r $HOME/.vim/templates/sh.template
endif

""}}}

" Vim syntax settings   *vimrc-syntax*  |vimrc-index|   "{{{
" Moved to specific syntax ftplugin
"autocmd Syntax * syntax keyword Todo NOTE WISH containedin=.*Comment
"}}}

" vim-airline settings  *vimrc-vim-airline*   |vimrc-index|   "{{{
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

" vim-airline-tabline settings  *vimrc-tabline* |vimrc-index|   "{{{
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

" NERDTree settings *vimrc-nerdtree*   |vimrc-index|   "{{{
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

" Command-T settings    *vimrc-command-t*   |vimrc-index|  "{{{
" let $RUBYHOME=$HOME."/.rbenv/versions/2.3.7"
" set rubydll=$HOME/.rbenv/versions/2.5.1/lib/libruby.2.5.1.dylib

if has('win32') || has('win64')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.class,*.pyc
else
    set wildignore+=*/tmp/*,*.so,*.zip,*.swp,*.class,*.pyc,*/bin/*,*/project/*,*/target/*,*/.git/*,*.o
endif
let g:CommandTMaxDepth = 20
let g:CommandTMaxHeight = 20
let g:CommandTMatchWindowReverse = 1
let g:CommandTTraverseSCM='pwd'
map <leader>ff <Esc>:CommandT<CR>
map <leader>fj <Esc>:CommandTJump<CR>
""}}}

" YouCompleteMe settings    *vimrc-youcompleteme*   |vimrc-index|  "{{{
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

" Eclim settings    *vimrc-eclim*   |vimrc-index|  "{{{
let g:EclimCompletionMethod='omnifunc'
let g:EclimScalaValidate=1
""}}}

" Delimitmate settings *vimrc-delimitmate*  |vimrc-index|  "{{{
let delimitMate_expand_cr = 1
""}}}

" vim-rooter settings   *vimrc-rooter*  |vimrc-index|  "{{{
"let g:rooter_autocmd_patterns = '*.java,*.tex,*vimrc,*.vim'
let g:rooter_patterns = [
    \ '_vimrc_',
    \ '.localvimrc',
    \ '.envrc',
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

"vim-snippets settings  *vimrc-snippets*    |vimrc-index|  "{{{
let g:snips_author="Raajay Viswanathan"
let g:snips_email="raajay.v@gmail.com"
let g:snips_github="https://github.com/raajay"
let g:pybin = substitute(system('which python'), '\n', '', '')
""}}}

" UltiSnips settings    *vimrc-ultisnips*   |vimrc-index|  "{{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
""}}}

" vim-gitgutter settings    *vimrc-gitgutter*   |vimrc-index|  "{{{
let g:gitgutter_map_keys = 0
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterUndoHunk
nmap <leader>hd <Plug>GitGutterPreviewHunk
nmap <leader>hh <Plug>GitGutterNextHunk
nmap <leader>hp <Plug>GitGutterPrevHunk
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
""}}}

" vim-fugitive settings *vimrc-fugitive*    |vimrc-index|  "{{{
nmap <leader>gs <Esc>:Gstatus<CR>
nmap <leader>gc <Esc>:Gcommit -m<Space>""<left>
nmap <leader>gp <Esc>:Gpush<CR>
nmap <leader>gl <Esc>:Glog -n 10 --<CR>
set previewheight=30
" make the status window the bottom most one
autocmd FileType gitcommit wincmd J
""}}}

" vimtex settings   *vimrc-vimtex*  |vimrc-index|  "{{{
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

" indentLine settings   *vimrc-indexline*  |vimrc-index|  "{{{
let g:indentLine_enabled=1
let g:indentLine_color_term = 237
let g:indentLine_concealcursor=''
let g:indentLine_conceallevel=0
map <leader>il <Esc>:IndentLinesToggle<cr>
""}}}

" vim-go settings   *vimrc-vimgo*   |vimrc-index|  "{{{
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 0
let g:go_highlight_structs = 1
let g:ycm_semantic_triggers.go = ['.']
""}}}

" Vim session settings  *vimrc-settings*    |vimrc-index|   "{{{
let g:session_autosave='no'
""}}}

" goyo.vim settings *vimrc-goyo*  |vimrc-index|   "{{{
"let g:goyo_width=120
"let g:goyo_height=60
map <leader>z <Esc>:Goyo 80x40<CR>
""}}}

" NERDCommenter *vimrc-nerdcommenter* |vimrc-index|   "{{{
"map <leader>// <Esc>:NERDComComment<CR>
let g:NERDSpaceDelims=1
""}}}

" vim-mru settings  *vimrc-mru* |vimrc-index|   "{{{
"map <leader>ls <Esc>:MRU<CR>
""}}}

" vim-buffergator settings *vimrc-buffergator*  |vimrc-index|  "{{{
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
nnoremap ;A <Esc>:AlternateSplit<CR>
"}}}

" vim-clang-format settings "{{{
let g:clang_format#auto_format=1
let g:clang_format#auto_formatexpr=1
"}}}

" Misc settings"{{{
" Tabularize - Helps in alignment
map <leader>b <Esc>:Tabularize<Space>
" Navigation Settings
map <leader>pp <Esc><c-w><c-p>
""}}}

" Pathogen settings *vimrc-pathogen*    |vimrc-index|  "{{{
let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'command-t')
""}}}

" Source private VIMRC
if !empty(glob('~/_vimrc_private'))
    source ~/_vimrc_private
endif

" Source local VIMRC
if !empty(glob('.localvimrc'))
    source .localvimrc
endif

" Activate plugins
call pathogen#infect()
call pathogen#helptags()

" Vim compile instructions      *vim-compile*   {{{
" For MacVim
" git clone macvim
" cd src; ./configure --enable-multibyte --enable-pythoninterp --enable-rubyinterp --enable-cscope
" cd MacVim/build/Release; open MacVim.app
" cp MacVim/build/Release/MacVim.app /Applications
"}}}

" Regex for Vim
" 1. http://vimregex.com
"
" Manage pathogen plugins

" Nixed the following plugins on
" Tue Jul 24 23:27:47 CDT 2018
" call add(g:pathogen_disabled, 'ale')
" call add(g:pathogen_disabled, 'color_coded')
" call add(g:pathogen_disabled, 'vim-gtags-cscope')
" call add(g:pathogen_disabled, 'tabular')
" call add(g:pathogen_disabled, 'tasklist')
" call add(g:pathogen_disabled, 'vim-ansible')
" call add(g:pathogen_disabled, 'vim-gtags')
" call add(g:pathogen_disabled, 'vim-gtags-cscope')
" call add(g:pathogen_disabled, 'vim-mru')
" call add(g:pathogen_disabled, 'vim-multiple-cursors')
" call add(g:pathogen_disabled, 'vim-pencil')
" call add(g:pathogen_disabled, 'vim-shell')
" call add(g:pathogen_disabled, 'vimtex')
" call add(g:pathogen_disabled, 'vim-wordy')
" Nixed the following on
" 20-Oct-2019 20:45
" call add(g:pathogen_disabled, 'vim-gundo')
" call add(g:pathogen_disabled, 'vim-session')
" call add(g:pathogen_disabled, 'YouCompleteMe')
" call add(g:pathogen_disabled, 'ropevim')
" call add(g:pathogen_disabled, 'vim-gtags-cscope')
" call add(g:pathogen_disabled, 'ultisnips')
