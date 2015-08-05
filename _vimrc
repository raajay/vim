set nocompatible                    " do not force it to be vi compatible
set number                          " set line numbers
set norelativenumber                " relative line numbers are awesome.
                                    " we will use it when needed with ,rn map

set numberwidth=5                   " the number of columns for line numbers
set mouse=a                         " enable mouse clicks for all modes
set backspace=eol,indent,start      " characters that backspace can erase
set nowrap                          " do not wrap lines
set ruler                           " ruler format can be set; but I use vim-airline
set noerrorbells novisualbell t_vb= " I have no idea what to do here
au GUIEnter * set vb t_vb=          " Values get reset when GUI starts
                                    " Set them once we enter GUIEnter

set pastetoggle=<F2>                " disable indenting while pasting code
set hidden                          " allows us to move away from unsaved buffers
set noshowmatch                     " do not jump to matching brace

syntax on                           " Switch on syntax highlighting
filetype plugin on                  " Detect filetype plugin and source them
filetype indent on                  " Indent based on filetypes

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

set textwidth=0   " no text width (moved to ft specific)
set cursorline    " highlights the row the cursor is on
set cursorcolumn  " highlights the current column
set lazyredraw    " to speed up the effects of highlighting row or column
set laststatus=2  " to display the status line always
set showtabline=2 " to show the tab line always
set spell         " spell check, XXX where is the dictionary
set autochdir     " change to the directory of the current file
set splitright    " the new windows opens on the right
set splitbelow    " horizontal split below

let mapleader = ","
let g:my_background='dark'
let g:my_colorscheme='solarized'
let g:my_airlinetheme = 'solarized'


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

elseif(g:my_colorscheme == 'molokai')

    let g:airline_theme=g:my_airlinetheme
    colorscheme molokai

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
        set guifont=Monospace\ 9
    elseif has("gui_macvim")
        set antialias
        set guifont=Menlo\ Regular:h11
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

" sudo write
cnoremap sudow w !sudo tee % > /dev/null

" C-y copies to global buffer, copying across applications
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

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

" Vim - latex settings
set grepprg=grep\ -nH\ $*

" vim-airline settings
"let g:airline_left_sep = '>>'   " separator used on the left side of airline
"let g:airline_right_sep = '<<'  " separator used on the right side of airline
" some fancy stuff
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀ '
"" setting this will avoid displaying all buffers and display only current buffer
"let g:airline_section_c = '%t'
let g:airline_powerline_fonts = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''

" vim-airline-tabline settings
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

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0

let g:airline#extensions#whitespace#trailing_format = 'tr[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mi[%s]'

" vim-bufferline settings
" The next two lines are required for status line integration
let g:bufferline_echo = 0 " avoid displaying in the command line
autocmd VimEnter * let &statusline='%{bufferline#refresh_status()}' .bufferline#get_status_string()
let g:airline_section_b = '%{getcwd()." (".airline#util#wrap(airline#extensions#branch#get_head(),0).")"}'


let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_active_highlight = 'airline_c_bold'
let g:bufferline_inactive_highlight = 'airline_c'
let g:bufferline_modified = '+'
let g:bufferline_excludes = [] " TODO include the auto generated files

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

set winaltkeys=no

" ctrlp settings
if has('win32') || has('win64')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
    set runtimepath^=~/vimfiles/bundle/ctrlp.vim
else
    set wildignore+=*/tmp/*,*.so,*.zip,*.swp
    set runtimepath^=~/.vim/bundle/ctrlp.vim
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
let g:ycm_server_log_level = 'debug'
let g:ycm_server_keep_logfiles = 1
let g:ycm_path_to_python_interpreter='/usr/bin/python'
if(hostname() == "dove.cs.wisc.edu")
    let g:clang_library_path="/unsup/llvm-3.3/lib"
endif

" Eclim settings
let g:EclimCompletionMethod='omnifunc'

" Delimitmate settings
let delimitMate_expand_cr = 1

" vim-rooter settings
"let g:rooter_autocmd_patterns = '*.java,*.tex,*vimrc,*.vim'
let g:rooter_patterns = ['.gradlemain', '.latexmain', '.htmlmain', '.main', '.git', '.git/']
let g:rooter_use_lcd = 1
"let g:rooter_manual_only = 1


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
" toggle background
map <leader>cc <Esc>:call ToggleBG()<cr>
" reload file
map <leader>re <Esc>:checktime<cr>

" Take a backup of a file
command! Bak :w %.bak

" NERDTree settings
map <leader>nt <Esc>:NERDTreeToggle<cr>

" Tagbar settings
map <leader>tt <Esc>:TagbarToggle<CR>

" Tabularize - Helps in alignment
map <leader>tb <Esc>:Tabularize<Space>

" Navigation Settings
map <leader>pp <Esc><c-w><c-p>

" Tasklist invocation (,t is mapped to Command-T)
map <leader>v <Plug>TaskList

" Disable certain plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-session')
call add(g:pathogen_disabled, 'vim-misc')
call add(g:pathogen_disabled, 'ctrlp.vim')

if has('win32') || has('win64')
    call add(g:pathogen_disabled, 'YouCompleteMe')
else
    call add(g:pathogen_disabled, 'YouCompleteMe-Windows')
end

" Pathogen Settings - Used to handle the various plug-ins
call pathogen#infect()
call pathogen#helptags()
