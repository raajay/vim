"syn region texRefZone		matchgroup=texStatement start="\\\(sec\|fig\|c\|C\)ref{"	end="}\|%stopzone\>"	contains=@texRefGroup
" highlight only comments

" help negative look behind in vim :
" http://ssiaf.blogspot.com/2009/07/negative-lookbehind-in-vim.html
"
syn clear
" match comments
syn match texComment "\(\\\)\@<!%.*$"
" match statements
syn match texStatement "\\[a-zA-Z]*" contains=@NoSpell

syn keyword texTodo TODO WISH XXX containedin=.*Comment
"
hi def link texComment Comment
hi def link texStatement Statement
hi def link texTodo Todo
