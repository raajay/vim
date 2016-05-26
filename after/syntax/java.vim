"syntax match javaClassVariable '\b_[a-zA-Z0-9_]*\b'
syntax match javaClassVariable '\<_\w*' containedin=JavaParen,JavaParenT
syntax keyword javaCommonDataStruct Set HashSet containedin=JavaParen
syntax keyword javaCommonDataStruct Map HashMap SortedMap TreeMap containedin=JavaParen
syntax keyword javaCommonDataStruct List ArrayList containedin=JavaParen
syntax keyword javaCommonDataType String Integer Double Long containedin=JavaParen

syntax cluster javaTop add=javaCommonDataType
syntax cluster javaTop add=javaCommonDataStruct

hi javaClassVariable ctermfg=141 ctermbg=NONE cterm=NONE
hi javaCommonDataStruct ctermfg=67 ctermbg=NONE cterm=NONE
hi javaCommonDataType ctermfg=81 ctermbg=NONE cterm=NONE
