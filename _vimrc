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

set textwidth=0     " no text width (moved to ft specific)
set cursorline      " highlights the row the cursor is on
set cursorcolumn    " highlights the current column
set laststatus=2    " to display the status line always
set showtabline=2   " to show the tab line always
set spell           " spell check, XXX where is the dictionary
set autochdir       " change to the directory of the current file
"set splitright     " the new windows opens on the right
set splitbelow      " horizontal split below

if has('gui_running')
    let g:my_background='light'
else
    let g:my_background='light'
end

if(g:my_background == 'light')
    set background=light
else
    set background=dark
endif

set t_Co=256        " everything is a 256 color terminal
"let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_italic=1
colorscheme solarized " never change

if has('win32') || has('win64')
    let g:vim_folder = '~/vimfiles/'
else
    let g:vim_folder = '~/.vim/'
endif

" system specific settings
let g:vimrc = g:vim_folder . '_vimrc'
let g:local_vimrc = g:vim_folder . '_local_vimrc'
exec "set backupdir=".g:vim_folder."vimbackup//"
exec "set dir=".g:vim_folder."vimswap//"
exec "source ".g:local_vimrc

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
    set columns=87    " specifies the width of the GVim window
    set lines=50      " specifies the height of the GVim window
endif

" mappings to avoid common mistakes in Vim
map :W :wz<BS>
map :Q :qz<BS>
map :B :bz<BS>
cnoremap sudow w !sudo tee % > /dev/null

" C-y copies to global buffer, copying across applications
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

set timeoutlen=3000
set ttimeoutlen=50
set updatetime=300 " time taken by vim-bufferline to redraw

" file type detection
if has("autocmd")
    autocmd BufRead,BufNewFile *.tex set ft=tex
    autocmd BufRead,BufNewFile *.gms set ft=gams
    autocmd BufRead,BufNewFile *.lst set ft=lst
    autocmd BufRead,BufNewFile *.gradle set ft=groovy
endif

" Vim - latex settings
set grepprg=grep\ -nH\ $*

" vim-airline settings
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 0
let g:airline_section_c = '%t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline_left_sep = '>>'
let g:airline_right_sep = '<<'


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


"jedi-vim settings
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#rename_command = ""

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

" clang_complete settings
let g:clang_use_library = 1
if has('mac')
    let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"
else
    let g:clang_library_path="/unsup/llvm-3.3/lib"
endif
let g:clang_complete_auto = 0       " use <TAB> to complete
let g:clang_complete_copen = 1      " show clang errors in quick fix

" syntastic settings
let g:syntastic_cpp_check_header = 1
if has('mac')
    let g:syntastic_cpp_include_dirs = ["/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"]
else
    let g:syntastic_cpp_include_dirs = ["/unsup/llvm-3.3/include"]
endif
let g:syntastic_mode_map={ 'mode': 'passive',
            \ 'active_filetypes': ['cs', 'py'],
            \ 'passive_filetypes': ['html', 'cpp', 'h'] }

" ctrlp plugin
if has('win32') || has('win64')
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
    set runtimepath^=~/vimfiles/bundle/ctrlp.vim
else
    set wildignore+=*/tmp/*,*.so,*.zip,*.swp
    set runtimepath^=~/.vim/bundle/ctrlp.vim
endif


" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_warning_symbol = '>'
let g:ycm_autoclose_preview_window_after_completion = 1

" Eclim
let g:EclimCompletionMethod='omnifunc'

" Delimitmate
let delimitMate_expand_cr = 1

" vim-rooter
let g:rooter_autocmd_patterns = '*.java,*.tex'
let g:rooter_patterns = ['.gradlemain', '.latexmain', '.htmlmain']
let g:rooter_use_lcd = 1
"let g:rooter_manual_only = 1

" git gutter settings

" ctrl-p
let g:ctrlp_custom_ignore = {'file': '\.class$\|\.exe$\|\.pyc$'}

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


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
        let g:airline_theme = 'solarized'
    else
        let g:my_background="light"
        set background=light
        let g:airline_theme = 'solarized'
    endif
endfunc


let mapleader = ","
map <leader>a <Esc>:call OpenToDo()<cr>
" push vim to the background and give shell access
map <leader>q <Esc><c-z>
" edit vimrc
map <leader>ev <Esc>:edit $MYVIMRC<cr>
" source vimrc
map <leader>sv <Esc>:source $MYVIMRC<cr>
" editbash
map <leader>eb <Esc>:edit ~/.bashrc<cr>

" toggle relative numbers
map <leader>rn :set relativenumber!<cr>
" remove trailing characters
map <leader>tr <Esc>:%s/\ *$//g<cr><c-o>
" toggle background
map <leader>cc <Esc>:call ToggleBG()<cr>
" reload file
map <leader>re <Esc>:checktime<cr>
command! Bak :w %.bak

" NERDTree settings
map <leader>nt <Esc>:NERDTreeToggle<cr>

" Tagbar settings
map <leader>tt <Esc>:TagbarToggle<CR>

" Tabularize - helps in alignment
map <leader>tb <Esc>:Tabularize<Space>

" navigation settings
map <leader>pp <Esc><c-w><c-p>

" Disable certain plugins
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'Omnisharp')
call add(g:pathogen_disabled, 'jedi-vim')
call add(g:pathogen_disabled, 'clang_complete')
call add(g:pathogen_disabled, 'syntastic')
call add(g:pathogen_disabled, 'vim-gitgutter')

if has('win32') || has('win64')
    call add(g:pathogen_disabled, 'YouCompleteMe')
else
    call add(g:pathogen_disabled, 'YouCompleteMe-Windows')
end

" Pathogen Settings - Used to handle the various plug-ins
call pathogen#infect()
call pathogen#helptags()
