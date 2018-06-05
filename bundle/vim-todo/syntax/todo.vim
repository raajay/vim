" Vim syntax file
" Filenames:    *.todo
" ============================================================================

if exists("b:current_syntax")
    finish
endif

syn case ignore

syn match todoDone "^\_s*x.*$"
syn match todoOpen "^\_s*o.*$"
syn match todoWorking "^\_s*w.*$"
syn match todoComment "%.*$"
syn match todoHeader "^*.*$"

" Define default colors if a global variable is set in vimrc
if !exists("g:vim_todo_define_colors")
    let g:vim_todo_define_colors = 1
endif

if g:vim_todo_define_colors == 1
    hi todoOpen ctermfg=46 ctermbg=NONE cterm=NONE guifg=#A6E22A guibg=NONE
    hi todoDone ctermfg=88 ctermbg=NONE cterm=NONE guifg=#F92672 guibg=NONE
    hi todoWorking ctermfg=186 ctermbg=NONE cterm=NONE guifg=#E6DB74 guibg=NONE
else
    hi def link todoDone Preprocessor
    hi def link todoOpen Statement
    hi def link todoWorking Todo
endif
hi def link todoComment Comment
hi def link todoHeader Header

let b:current_syntax = "todo"

" http://vim.wikia.com/wiki/Search_across_multiple_lines
