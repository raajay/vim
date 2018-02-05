highlight clear
set background=light

if exists("syntax_on")
  syntax reset
endif

runtime colors/default.vim

let g:colors_name='rj_emacs'

hi clear CursorLine
hi clear CursorColumn
hi clear ColorColumn
hi clear Folded
hi clear Comment
hi clear VertSplit
hi clear LineNr
hi clear CursorLineNr

hi CursorLine ctermfg=NONE ctermbg=253 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=253 cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=253 cterm=NONE
hi Folded ctermfg=242 ctermbg=NONE cterm=NONE
hi Comment ctermfg=243 ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=243 ctermbg=NONE cterm=NONE
hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
hi CursorLineNr ctermfg=241 ctermbg=NONE cterm=bold
