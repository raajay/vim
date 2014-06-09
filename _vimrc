set nocompatible " do not force it to be vi compatible
set number
set relativenumber " this is awesome! Line numbers relative to current line
set mouse=a
set background=dark
set backspace=eol,indent,start
set nowrap
set ruler
set noerrorbells novisualbell t_vb=
set pastetoggle=<F2> " disable indenting while pasting code
set hidden " allows us to move away from unsaved buffers

syntax on
filetype plugin on
filetype indent on

" setting the general tab setting to 4 spaces. In specific cases like latex,
" I forcefully change it to 2 spaces in ftplugin
set tabstop=4
set shiftwidth=4
set expandtab     " no more tabs; replace with spaces
set softtabstop=4 " backspace can take 4 spaces

set scrolloff=3 " retain 3 lines for context while scrolling
set autoindent  " automatically indent the files
set incsearch
" set hlsearch
" set smartindent " interferes with python indenting

if exists('+colorcolumn')
    set colorcolumn=80 " highlights the 80th column
endif

set textwidth=75  " automatically breaks line after 80 characters
set cursorline    " highlights the row the cursor is on
set cursorcolumn  " highlights the current column
set laststatus=2 " to display the status line always
set showtabline=2 " to show the tab line always
set spell " spell check, XXX where is the dictionary
set autochdir " change to the directory of the current file
"set splitright  "the new windows opens on the right
set splitbelow  "horizontal split below

set t_Co=256 " everything is a 256 color terminal
colorscheme solarized " never change
let g:solarized_termtrans=0
let g:solarized_termcolors=256
let g:solarized_italic=1

if has('win32') || has('win64')
    let g:vim_folder = '~/vimfiles/'
    "let g:llvm_folder = "/unsup/llvm-3.3/lib"
else
    let g:vim_folder = '~/.vim/'
endif

" system specific settings
let g:vimrc = g:vim_folder . '_vimrc'
let g:local_vimrc = g:vim_folder . '_local_vimrc'
exec "set backupdir=".g:vim_folder."vimbackup//"
exec "set dir=".g:vim_folder."vimswap//"
exec "source ".g:local_vimrc

" Commenting and folding has been moved to specific ftplugins

" block indent general - 4 spaces
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>

" remembering the previous edits - this is a gem
set viminfo='10,\"100,:20,%,n~/.viminfo

" remembering the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif

if has('gui_running')
    set guifont=Consolas:h10:cANSI
    set guioptions-=m  " removes the menu bar
    set guioptions-=T  " removes the tool bar
    set guioptions-=r  " removes the scroll bar
    set guioptions-=e  " removes the tab label
    " set columns=87  " specifies the width of the GVim window
    " set lines=50  " specifies the height of the GVim window
endif

" mappings to avoid common mistakes in Vim
map :W :wz<BS>
map :Q :qz<BS>
map :B :bz<BS>

" C-y copies to global buffer, copying across applications
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

set timeoutlen=3000
set ttimeoutlen=50
set updatetime=400 " time taken by vim-bufferline to redraw

" Vim - latex settings
set grepprg=grep\ -nH\ $*
if has("autocmd")
    autocmd BufRead,BufNewFile *.tex set ft=tex
endif

" vim-airline settings
let g:airline_theme = 'airlineish'
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
" TODO figure this shit out - partially done
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-p>'


"jedi-vim settings
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

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

" let g:Imap_DeleteEmptyPlaceHolders=0
set winaltkeys=no

" clang_complete settings
let g:clang_use_library = 1
let g:clang_library_path="/unsup/llvm-3.3/lib"
let g:clang_complete_auto = 0 " use <TAB> to complete
let g:clang_complete_copen = 1 "show clang errors in quick fix

" syntastic settings
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_include_dirs = ["/unsup/llvm-3.3/include"]
let g:syntastic_mode_map={ 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html', 'cpp', 'h', 'py'] }


" TODO write a function to toggle todo list
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

" customized file openings
let mapleader = ","
map <leader>a <Esc>:call OpenToDo()<cr>
map <leader>ev <Esc>:vsplit $MYVIMRC<cr>
map <leader>sv <Esc>:source $MYVIMRC<cr>
" TODO add mapping for bashrc

" NERDTree settings
map <leader>nt <Esc>:NERDTreeToggle<cr>
" Tagbar settings
map <leader>tt <Esc>:TagbarToggle<CR>
" toggle relative numbers
noremap <F7> :set relativenumber!<cr>
" remove trailing characters
map <leader>tr <Esc>:%s/\ *$//g<cr><c-o>

" Pathogen Settings - Used to handle the various plug-ins
call pathogen#infect()
