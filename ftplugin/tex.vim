" indent 
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set autoindent
set smartindent
set colorcolumn=80
set textwidth=80

" block indent
map > :s/^/\ \ /<CR>
map < :s/^\ \ //<CR>

" commenting
map // :s/^/%/<CR>
map \\ :s/^%//<CR>

set iskeyword+=_,;

" compiler customization
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex --shell-escape -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_dvi='latex --shell-escape -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_ViewRule_pdf='mupdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_UseMakefile=0


let g:Tex_GotoError=0
setlocal efm+=%E%f:%l:\ %m


" Tex specific IMAPS
:call IMAP('EFS',"\\begin{figure}\<CR><++>\<CR>\\end{figure}<++>",'tex')
:call IMAP('EBF',"\\begin{frame}{<++>}\<CR><++>\<CR>\\end{frame}<++>",'tex')
:call IMAP('SS*', "\\subsection*{<++>}\<CR><++>", 'tex')
:call IMAP('SE*', "\\section*{<++>}\<CR><++>", 'tex')

" Folding
let g:Tex_FoldedMisc='comments' 
let g:Tex_FoldedEnvironments='abstract,thebibliography,comment'

" highlighting. We do not need matching parentheses in latex. 
hi MatchParen ctermbg=none ctermfg=none cterm=none
