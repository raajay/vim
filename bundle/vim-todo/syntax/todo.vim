" Vim syntax file
" Filenames:       *.todo
" ============================================================================

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn match todoDone "^x.*$"
syn match todoOpen "^o.*$"
syn match todoWorking "^w.*$"

" Define default colors if a global variable is set in vimrc
if !exists("g:vim_todo_define_colors")
    let g:vim_todo_define_colors = 1
endif

if g:vim_todo_define_colors == 1
    hi todoDone ctermfg=46 ctermbg=NONE cterm=NONE guifg=#A6E22A guibg=NONE
    hi todoOpen ctermfg=88 ctermbg=NONE cterm=NONE guifg=#F92672 guibg=NONE
    hi todoWorking ctermfg=186 ctermbg=NONE cterm=NONE guifg=#E6DB74 guibg=NONE
else
    hi def link todoDone Preprocessor
    hi def link todoOpen Statement
    hi def link todoWorking Todo
endif



let b:current_syntax = "todo"
