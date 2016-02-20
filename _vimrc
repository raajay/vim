set nocompatible                    " do not force it to be vi compatible
set number                          " set line numbers
set relativenumber                " relative line numbers are awesome.
                                    " we will use it when needed with ,rn map

set numberwidth=5                   " the number of columns for line numbers
set mouse=a                         " enable mouse clicks for all modes
set backspace=eol,indent,start      " characters that backspace can erase
set wrap                            " do not wrap lines
set ruler                           " ruler format can be set; but I use vim-airline
set noerrorbells novisualbell t_vb= " I have no idea what to do here
au GUIEnter * set vb t_vb=          " Values get reset when GUI starts
                                    " Set them once we enter GUIEnter

set pastetoggle=<F2>                " disable indenting while pasting code
set hidden                          " allows us to move away from unsaved buffers
set noshowmatch                     " do not jump to matching brace

filetype plugin on                  " Detect filetype plugin and source them
filetype indent on                  " Indent based on filetypes
syntax on                           " Switch on syntax highlighting

" setting the general tab setting to 4 spaces.
set tabstop=4     " One tab is 4 spaces
set shiftwidth=4  " Indent to use 4 spaces
set expandtab     " no more tabs; replace with spaces
set softtabstop=4 " backspace can run over 4 spaces in one key press

set scrolloff=3   " retain 3 lines for context while scrolling
set autoindent    " automatically indent the files
set incsearch     " search before we press enter for search
" set hlsearch    " highlight search
" set smartindent " removed since it interferes with python commenting

if exists('+colorcolumn')
    set colorcolumn=80 " highlights the 80th column
endif

set textwidth=0         " no text width (moved to ft specific)
set cursorline          " highlights the row the cursor is on
set cursorcolumn        " highlights the current column
set lazyredraw          " to speed up the effects of highlighting row or column
set laststatus=2        " to display the status line always
set showtabline=2       " to show the tab line always
set spell               " spell check, XXX where is the dictionary
set autochdir           " change to the directory of the current file
set splitright          " the new windows opens on the right
set splitbelow          " horizontal split below
set termencoding=utf-8
set printoptions=number:y

" update the variables with environment variables
let mapleader=$LEADER
let g:my_background=$BACKGROUND
let g:my_colorscheme=$COLORSCHEME
let g:my_airlinetheme=$AIRLINE_THEME

" default values for configuration variables
if (mapleader == '')
    let mapleader=','
endif

if (g:my_background == '')
    let g:my_background='light'
endif

if (g:my_colorscheme == '')
    let g:my_colorscheme='solarized'
endif

if (g:my_airlinetheme == '')
    let g:my_airlinetheme = 'solarized'
endif

hi Normal ctermbg=None

if(g:my_background == 'light')
    set background=light
else
    set background=dark
endif

set t_Co=256

if(g:my_colorscheme == 'solarized')

    let g:solarized_termtrans=0
    let g:solarized_italic=1
    let g:airline_theme=g:my_airlinetheme
    colorscheme solarized

elseif(g:my_colorscheme == 'monokai')

    let g:airline_theme='molokai'
    colorscheme monokai

endif

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
"exec "source ".g:local_vimrc

" Block indent general mapping - overridden in ftplugins
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>

" Commenting in specific plugins

" remembering the previous edits - this is a gem
set viminfo='10,\"100,:20,%,n~/.viminfo

" remembering the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ for\ Powerline
    elseif has("gui_macvim")
        set antialias
        set guifont=Source\ Code\ Pro\ for\ Powerline:h13
    elseif has("gui_win32")
        set guifont=Consolas:h9:cANSI
    endif

    set guioptions-=m " removes the menu bar
    set guioptions-=T " removes the tool bar
    set guioptions-=L " removes the left scroll bar with Nerd Tree
    set guioptions-=r " removes the right scroll bar
    set guioptions-=e " removes the tab label
    set columns=120    " specifies the width of the GVim window
    set lines=120     " specifies the height of the GVim window
endif

" mappings to avoid common mistakes in Vim
map :W :wz<BS>
map :Q :qz<BS>
map :B :bz<BS>

" mapping for common patters in insert mode
imap TODO TODO(raajay)<Space>
imap XXX XXX(raajay)<Space>

" sudo write
cnoremap sudow w !sudo tee % > /dev/null

" C-y copies to global buffer, copying across applications
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Common mappings for navigation
nmap <space> zz
nmap n nzz
nmap N Nzz

set timeoutlen=3000
set ttimeoutlen=50
set updatetime=30 " time taken by bufferline to redraw

" file type detection
if has("autocmd")
    autocmd BufRead,BufNewFile *.tex set ft=tex
    autocmd BufRead,BufNewFile *.gms set ft=gams
    autocmd BufRead,BufNewFile *.lst set ft=lst
    autocmd BufRead,BufNewFile *.gradle set ft=groovy
    autocmd BufRead,BufNewFile *.md set ft=markdown
    autocmd BufRead,BufNewFile *.scala set ft=scala
    autocmd BufRead,BufNewFile _bash* set ft=sh
    autocmd BufRead,BufNewFile *.mutt set ft=muttrc
endif

" vim-airline settings
let g:airline_section_b = '%{pathshorten(getcwd())."  ".airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_c = '%{pathshorten(expand("%:p"))}' " full file name
"      \ [ 'x', 'y', 'z', 'warning' ]
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'z', 'warning' ]
      \ ]

" vim-airline-symbols
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

" Power line symbols - just used for separation
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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

" vim-airline-tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1       " show buffers in the tabline
let g:airline#extensions#tabline#tab_nr_type = 2        " splits and tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1    " allow navigation using hot keys
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

" vim-bufferline settings
" The next two lines are required for status line integration
"let g:bufferline_echo = 0 " avoid displaying in the command line
"autocmd VimEnter * let &statusline='%{bufferline#refresh_status()}' .bufferline#get_status_string()
"let g:bufferline_active_buffer_left = '['
"let g:bufferline_active_buffer_right = ']'
"let g:bufferline_active_highlight = 'airline_c_bold'
"let g:bufferline_inactive_highlight = 'airline_c'
"let g:bufferline_modified = '+'
"let g:bufferline_excludes = [] " TODO include the auto generated files

" NERDTree settings
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.sln$', '\.suo$', '\.swp$']
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tabs = 0
let g:nerdtree_tabs_autoclose = 0
let NERDTreeHijackNetrw = 0
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowLineNumbers = 1

"super tab settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-p>'


" this is put under jedi vim because with out this jedi-vim seems to
" throw errors
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif
" Jedi Settings
let g:jedi#auto_initialization = 1
" Other Jedi settings have been moved to ftplugin/python.vim

set winaltkeys=no

" ctrlp settings
if has('win32') || has('win64')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
    set runtimepath^=~/vimfiles/bundle/vim-ctrlp
else
    set wildignore+=*/tmp/*,*.so,*.zip,*.swp
    set runtimepath^=~/.vim/bundle/vim-ctrlp
endif
let g:ctrlp_custom_ignore = {'file': '\.class$\|\.exe$\|\.pyc$', 'dir': '\v[\/]\.(git|hg|svn|bzr)$'}
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_files=10000
let g:ctrlp_max_depth=40
let g:ctrlp_user_command = 'find %s -type f \( -name "*.tex" -o -name "*.py" -o -name "*.java" -o -name "*.q" \)'

" Command-T settings
let g:CommandTMaxDepth = 20
let g:CommandTMaxHeight = 10
let g:CommandTMatchWindowReverse = 1
let g:CommandTTraverseSCM='pwd'

" YouCompleteMe settings
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
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

" Eclim settings
let g:EclimCompletionMethod='omnifunc'
" Eclim - Scala settings
let g:EclimScalaValidate=0

" Delimitmate settings
let delimitMate_expand_cr = 1

" vim-rooter settings
"let g:rooter_autocmd_patterns = '*.java,*.tex,*vimrc,*.vim'
let g:rooter_patterns = ['.gradlemain', '.latexmain', '.htmlmain', '.main', '.git', '.git/', 'pom.xml']
let g:rooter_use_lcd = 1
"let g:rooter_manual_only = 1

"vim-snippets settings
let g:snips_author="Raajay Viswanathan"
let g:snips_email="raajay.v@gmail.com"
let g:snips_github="https://github.com/raajay"
let g:pybin = substitute(system('which python'), '\n', '', '')

" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Tagbar settings
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds' : [
    \ 's:sections',
    \ 'g:graphics:0:0',
    \ 'l:labels',
    \ 'r:refs:1:0',
    \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort' : 0,
    \ }

" vim-gitgutter settings
let g:gitgutter_map_keys = 0
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hd <Plug>GitGutterPreviewHunk
nmap <Leader>hh <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk

" vim-fugitive settings
nmap <Leader>gs <Esc>:Gstatus<CR>
nmap <Leader>gc <Esc>:Gcommit -m<Space>""<left>
nmap <Leader>gp <Esc>:Gpush<CR>
nmap <Leader>gl <Esc>:Git log --oneline<CR>

" Function to toggle the to-do list
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


map <leader>a <Esc>:call OpenToDo()<cr>
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
map <leader>rt4 <Esc>:%s/\t/\ \ /g<cr><c-o>
" toggle background
map <leader>cc <Esc>:call ToggleBG()<cr>
" reload file
map <leader>re <Esc>:checktime<cr>

" Take a backup of a file
command! Bak :w %.bak

" NERDTree settings
map <leader>nt <Esc>:NERDTreeToggle<cr>

" Tagbar settings
map <leader>a <Esc>:TagbarToggle<CR>

" Tabularize - Helps in alignment
map <leader>b <Esc>:Tabularize<Space>

" Navigation Settings
map <leader>pp <Esc><c-w><c-p>

" Tasklist invocation (,t is mapped to Command-T)
map <leader>v <Plug>TaskList

" Vim - latex settings
set grepprg=grep\ -nH\ $*
" The Silver Searcher
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" My custom settings

" Number lines
command -range=% -nargs=? Number :<line1>,<line2>s/^/\=printf("%d<args>", line(".") - line("'<") + 1)

" Disable certain plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-session')
call add(g:pathogen_disabled, 'vim-misc')
call add(g:pathogen_disabled, 'vim-ctrlp')
call add(g:pathogen_disabled, 'vim-bufferline')
" Super tab made defunct by You Complete Me
call add(g:pathogen_disabled, 'supertab')
"call add(g:pathogen_disabled, 'tagbar')
"call add(g:pathogen_disabled, 'eclim')

if has('win32') || has('win64')
    call add(g:pathogen_disabled, 'YouCompleteMe')
else
    call add(g:pathogen_disabled, 'YouCompleteMe-Windows')
end

" Pathogen Settings - Used to handle the various plug-ins
call pathogen#infect()
call pathogen#helptags()
