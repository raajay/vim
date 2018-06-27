syn clear

" match comments
syn match vimComment "^\s*\".*$"
syn match vimComment "\"[^\"]\+$"
syn keyword vimTodo TODO WISH XXX containedin=.*Comment

hi def link vimComment Comment
hi def link vimTodo Todo
