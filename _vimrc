" basic setup
set nocompatible
set number
set mouse=a
set background=dark
set backspace=eol,indent,start
set nowrap
set ruler
set pastetoggle=<F2>
set hidden

syntax on
filetype plugin on
filetype indent on

" setting the general tab setting to 4 spaces. In specific cases like latex,
" I forcefully change it to 2 spaces in ftplugin
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" position cursor in the center
"set scrolloff=999
set autoindent
set incsearch
" set hlsearch
" set smartindent #interferes with python indenting

set colorcolumn=80 " highlights the 80th column
set textwidth=72  " automatically breaks line after 80 characters

set cursorline
set cursorcolumn
set showtabline " to show the tab line always

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if hostname() == "MacAir"
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    colorscheme solarized
    set guifont=Consolas:h10:cANSI
elseif has('gui_running')
    let g:solarized_italic=0
    colorscheme solarized
    set guioptions-=m  " removes the menu bar
    set guioptions-=T  " removes the tool bar
    set guioptions-=r  " removes the scroll bar
    set guioptions-=e  " removes the tab label
    set columns=87  " specifies the width of the GVim window
    set lines=50  " specifies the height of the GVim window
    set guifont=Consolas:h10:cANSI
else
    let g:solarized_termtrans=1
    let g:solarized_italic=0
    let g:solarized_termcolors=256
    colorscheme solarized
end

" spell checking setup for both GUI and Terminal
set spell

" files and directories
set autochdir

" set backup directory and swap directory to avoid storing the files in the
" same location as the source. The double slash at the end ensures that the
" full path of the file is used and hence avoid conflicts.
if has('win32') || has('win64')
    set backupdir=~/vimfiles/vimbackup//
    set dir=~/vimfiles/vimswap//
else
    set backupdir=~/.vim/vimbackup//
    set dir=~/.vim/vimswap//
endif

" removing the following as vim hangs at times because of this
"if has("autocmd")
"    " sources ~/.vimrc immediately after save
"    autocmd bufwritepost ~/.vimrc source $MYVIMRC
"endif

" block indent general - 4 spaces
map > :s/^/\ \ \ \ /<CR>
map < :s/^\ \ \ \ //<CR>

" remove trailing characters
map <F12> :%s/\ +$//g<CR>

" remembering the previous edits - this is a gem
set viminfo='10,\"100,:20,%,n~/.viminfo

" remembering the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") < line("$") | exe "normal! g'\"" | endif
endif

" Commenting and folding has been moved to specific ftplugins

" mappings to avoid common mistakes in Vim
map :W :wz<BS>
map :Q :qz<BS>
map :B :bz<BS>

"set splitright  "the new windows opens on the right
set splitbelow  "horizontal split below

" C-y copies to global buffer, copying across applications
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

set timeoutlen=3000
set ttimeoutlen=50

" Vim - latex settings
set grepprg=grep\ -nH\ $*
if has("autocmd")
    autocmd BufRead,BufNewFile *.tex set ft=tex
endif

" vim-airline settings
set laststatus=2 " to display the status line always

" Tagbar plugin
map <F4> <Esc>:TagbarToggle<CR>

" NERDTree settings
map <F3> <Esc>:NERDTreeToggle<CR>
command Nt execute NERDTree

let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.sln$', '\.suo$', '\.swp$']
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tabs = 0
let g:nerdtree_tabs_autoclose = 0
let NERDTreeHijackNetrw = 0
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowLineNumbers = 1

"super tab settings
let g:SuperTabDefaultCompletionType = "context"

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
let g:clang_library_path="/unsup/llvm-3.3/lib" "TODO: this should go under conditions
let g:clang_complete_auto = 0 " use <TAB> to complete
let g:clang_complete_copen = 1 "show clang errors in quick fix

" syntastic settings
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_include_dirs = ["/unsup/llvm-3.3/include"]
let g:syntastic_mode_map={ 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['html', 'cpp', 'h', 'py'] }

" Import local files
if has('win32') || has('win64')
    source ~\vimfiles\_local_vimrc
else
    source ~/.vim/_local_vimrc
endif

" Pathogen Settings - Used to handle the various plug-ins
call pathogen#infect()
