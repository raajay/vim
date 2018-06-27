syn clear

" match comments
syn match vimComment "^\s*\".*$"
syn match vimComment "\"[^\"]*"

hi def link vimComment Comment
