" Vim color file
" Author: Raajay Viswanathan <raajay.v@gmail.com>
"
" Note:
" 1. Converted from Textmate theme Monokai using Coloration v0.3.2
"    (http://github.com/sickill/coloration)
" 2. https://github.com/oneKelvinSmith/monokai-emacs/blob/master/monokai-theme.el
"

highlight clear
set background=dark

" xterm 256 colors"{{{
" Cyan : 81
" Violet : 141
" Powder Blue : 67
" Dark Blue : 24
" Green Dark : 64
" Green Light : 148
" Green Light 2 : 46
" Green Light 3 : 118
" Yellow : 186
" Orange : 208
" Red : 88
" Red Light : 197
" Magenta : 95 (used for folding)
" Gray : 59 (used for comments)
" "}}}

" HTML colors"{{{
" Blue : #66D9EF
" Blue Dark : #40CAE4
" Blue light : #89BDFF
" Violet : #AE81FF
" Cyan : #A1EFE4
" Green : #A6E22A
" Green Dark : #86C30D
" Green Light : #A6E22E
" Magenta : #F92672
" Purple : AE81FF
" Purple Light : FD5FF1
" Yellow : E6DB74
" Yellow Dark : 75715E
" Yellow Light : F8F8F2
" Orange : #FD971F
" Red : #F92672
" White : #F8F8F2
" Gray : #6c6c6c : 242
""}}}

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "monokai"


hi Normal ctermfg=247 ctermbg=233 cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
hi NonText ctermfg=59 ctermbg=234 cterm=NONE guifg=#49483e guibg=#31322c gui=NONE
hi LineNr ctermfg=102 ctermbg=232 cterm=NONE guifg=#90908a guibg=#202020 gui=NONE
hi SpecialKey ctermfg=59 ctermbg=233 cterm=NONE guifg=#49483e guibg=#3c3d37 gui=NONE

hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE

hi Cursor ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#49483e gui=NONE

hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE
hi MatchParen ctermfg=197 ctermbg=NONE cterm=underline guifg=#f92672 guibg=NONE gui=underline
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold guifg=#f8f8f2 guibg=#64645e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE guifg=#f8f8f2 guibg=#64645e gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#49483e gui=NONE
hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE guifg=#272822 guibg=#e6db74 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=bold guifg=NONE guibg=NONE gui=bold
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE

hi SignColumn ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#3c3d37 gui=NONE

hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Constant ctermfg=141 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=118 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE

hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold

hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE

hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Function ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi Keyword ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE

hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Operator ctermfg=118 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi PreCondit ctermfg=118 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=NONE
hi Macro ctermfg=193 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi PreProc ctermfg=118 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE

hi Statement ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi Tag ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold guifg=#75715e guibg=NONE gui=inverse,bold
hi Type ctermfg=81 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Typedef ctermfg=81 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

" Ruby Highlighting"{{{
hi rubyClass ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyFunction ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyStringDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyControl ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyException ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
""}}}
" HTML Highlighting"{{{
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
""}}}
" Java Script Highlighting"{{{
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=italic
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
""}}}
" YAML highlighting"{{{
hi yamlKey ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
""}}}
" CSS Highlighting"{{{
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=italic
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
""}}}
" Eclim Debug Highlighting"{{{
hi EclimDebugLine ctermfg=46 ctermbg=232 cterm=NONE guifg=#afff00 guibg=#272822 gui=NONE
""}}}
" Folding"{{{
hi Folded ctermfg=95 ctermbg=NONE cterm=NONE guifg=#855c1b guibg=#272822 gui=NONE
""}}}
" JavaDoc Highlighting"{{{
hi javaCommentStar ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi javaCommentTitle ctermfg=244 ctermbg=NONE cterm=bold guifg=#75715e guibg=NONE gui=NONE
hi javaDocComment ctermfg=242 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi javaDocParam ctermfg=186 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi javaDocTags ctermfg=64 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
""}}}
" Java Highlighting"{{{
hi javaScopeDecl ctermbg=NONE ctermfg=208 cterm=NONE
hi javaStorageClass ctermbg=NONE ctermfg=208 cterm=NONE
hi javaClassDecl ctermbg=NONE ctermfg=81 cterm=NONE
hi javaType ctermbg=NONE ctermfg=81 cterm=NONE
hi javaTypedef ctermbg=NONE ctermfg=81 cterm=NONE
hi javaOperator ctermbg=NONE ctermfg=64 cterm=NONE
hi javaConditional ctermbg=NONE ctermfg=208 cterm=NONE
hi javaRepeat ctermbg=NONE ctermfg=208 cterm=NONE
hi javaStatement ctermfg=197 ctermbg=NONE cterm=NONE
hi javaMethodDecl ctermfg=197 ctermbg=NONE cterm=NONE
" hi javaType
" hi javaTypedef
" hi javaScopeDecl
" hi javaStorageClass
" hi javaMethodDecl
" hi javaLineComment
" hi javaString
" hi javaOperator
" hi javaExceptions
" hi javaConditional
" hi javaExternal
" hi javaFuncDef
" hi javaBraces
""}}}
" Python Highlighting"{{{
hi pythonFunction guifg=#a6e22e guibg=#272822 gui=NONE
""}}}
" Fugitive Git Highlighting"{{{
hi gitcommitBranch ctermbg=NONE ctermfg=141 cterm=NONE guibg=NONE guifg=#ae81ff
hi gitcommitHeader ctermbg=NONE ctermfg=242 cterm=NONE guibg=NONE guibg=NONE guifg=#6c6c6c gui=NONE
hi gitcommitSelectedType ctermbg=NONE ctermfg=148 cterm=NONE guibg=NONE guifg=#a6e22e gui=NONE
hi gitcommitSelectedFile ctermbg=NONE ctermfg=148 cterm=bold guibg=NONE guifg=#a6e22e gui=bold
hi gitcommitDiscardedType ctermbg=NONE ctermfg=197 cterm=NONE guibg=NONE guifg=#ff4d4d gui=NONE
hi gitcommitDiscardedFile ctermbg=NONE ctermfg=197 cterm=bold guibg=NONE guifg=#ff4d4d gui=bold
hi gitcommitUntrackedFile ctermbg=NONE ctermfg=208 cterm=bold guibg=NONE guifg=#fd971f gui=bold
""}}}
" Vim Highlighting"{{{
hi vimCommand ctermbg=NONE ctermfg=208 cterm=NONE guibg=NONE guifg=#FD971F gui=NONE
hi vimAutoCmd ctermbg=NONE ctermfg=208 cterm=NONE guibg=NONE guifg=#FD971F gui=NONE
hi vimAutoEvent ctermbg=NONE ctermfg=197 cterm=NONE guibg=NONE guifg=#F92672 gui=NONE
hi vimOption ctermbg=NONE ctermfg=197 cterm=NONE guibg=NONE guifg=#F92672 gui=NONE
hi vimFTOption ctermbg=NONE ctermfg=197 cterm=NONE guibg=NONE guifg=#F92672 gui=NONE
hi vimFunction ctermbg=NONE ctermfg=64 cterm=NONE guibg=NONE guifg=#86C30D gui=NONE
hi vimFuncName ctermbg=NONE ctermfg=64 cterm=NONE guibg=NONE guifg=#86C30D gui=NONE
hi vimLet ctermbg=NONE ctermfg=24 cterm=NONE guibg=NONE guifg=#40CAE4 gui=NONE
hi vimVar ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimEnvvar ctermbg=NONE ctermfg=141 cterm=NONE guibg=NONE guifg=#AE81FF gui=NONE
hi vimSetEqual ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimSet ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimMapLhs ctermbg=NONE ctermfg=81 cterm=NONE guibg=NONE guifg=#A1EFE4 gui=NONE
hi vimMapRhs ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimMapModKey ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#F92672 gui=NONE
hi vimNotation ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#F92672 gui=NONE
hi vimBracket ctermbg=NONE ctermfg=88 cterm=NONE guibg=NONE guifg=#F92672 gui=NONE
hi vimTodo ctermbg=NONE ctermfg=198 cterm=bold
hi vimHiNmbr ctermbg=NONE ctermfg=141 cterm=NONE guibg=NONE guifg=#AE81FF gui=NONE
hi vimHiAttrib ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#89BDFF gui=NONE
hi vimHiGuiRgb ctermbg=NONE ctermfg=186 cterm=NONE guibg=NONE guifg=#E6DB74 gui=NONE
hi vimHiCTerm ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimHiCTermFgBg ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimHiGui ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
hi vimHiGuiFgBg ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#F8F8F2 gui=NONE
""}}}
" Markdown Highlighting"{{{
hi markdownBold ctermfg=252 ctermbg=NONE cterm=bold
hi markdownItalic ctermfg=252 ctermbg=NONE cterm=bold
hi markdownH1 ctermfg=208 ctermbg=NONE cterm=bold
hi markdownH2 ctermfg=148 ctermbg=NONE cterm=bold
hi markdownH3 ctermfg=64 ctermbg=NONE cterm=bold
hi markdownH4 ctermfg=186 ctermbg=NONE cterm=bold
""}}}
" Tex Highlighting"{{{
hi texBeginEndName ctermfg=186 ctermbg=NONE cterm=bold guifg=#E6DB74 guibg=NONE gui=bold
hi texBeginEnd ctermfg=64 ctermbg=NONE cterm=bold guifg=#A6E22A guibg=NONE gui=bold
hi texSection ctermfg=148 ctermbg=NONE cterm=bold guifg=#A6E22E guibg=NONE gui=bold
hi texRefZone ctermfg=141 ctermbg=NONE cterm=NONE guifg=#AE81FF guibg=NONE gui=NONE
hi texSectionZone ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi texSubSectionZone ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi texSubSubSectionZone ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi texTypeStyle ctermfg=81 ctermbg=NONE cterm=bold guifg=#FD5FF1 guibg=NONE gui=bold
hi texItalStyle ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi texNewCmd ctermfg=208 ctermbg=NONE cterm=NONE guifg=#75715E guibg=NONE gui=NONE
hi texCmdName ctermfg=64 ctermbg=NONE cterm=NONE guifg=#A6E22A guibg=NONE gui=NONE
hi texStatement ctermfg=67 ctermbg=NONE cterm=NONE guifg=#89BDFF guibg=NONE gui=NONE
hi texUrl ctermfg=186 ctermbg=NONE cterm=NONE guifg=#E6DB74 guibg=NONE gui=NONE
hi texDocType ctermfg=208 ctermbg=NONE cterm=NONE guifg=#FD5FF1 guibg=NONE gui=NONE
hi texDefCmd ctermfg=208 ctermbg=NONE cterm=NONE guifg=#FD5FF1 guibg=NONE gui=NONE
hi texDefName ctermfg=64 ctermbg=NONE cterm=NONE guifg=#A6E22A guibg=NONE gui=NONE
hi bibEntryKw ctermfg=64 ctermbg=NONE cterm=NONE guifg=#E6DB74 guibg=NONE gui=NONE
""}}}
" NERDTree Highlighting "{{{
hi NERDTreeUp ctermfg=81 ctermbg=NONE cterm=NONE
hi NERDTreeDir ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi NERDTreeExecFile ctermfg=118 ctermbg=NONE cterm=bold
""}}}
" C / C++ Highlighting "{{{
hi cInclude ctermfg=64 ctermbg=NONE cterm=NONE
hi cIncluded ctermfg=186 ctermbg=NONE cterm=NONE
hi cCustomFunc ctermfg=251 ctermbg=NONE cterm=NONE
hi cType ctermfg=67 ctermbg=NONE cterm=NONE
hi cppType ctermfg=67 ctermbg=NONE cterm=NONE
hi cStorageClass ctermfg=67 ctermbg=NONE cterm=NONE
hi cppStructure ctermfg=67 ctermbg=NONE cterm=NONE
hi cConditional ctermfg=208 ctermbg=NONE cterm=NONE
hi cRepeat ctermfg=208 ctermbg=NONE cterm=NONE
hi cStatement ctermfg=197 ctermbg=NONE cterm=NONE
hi cppStatement ctermfg=197 ctermbg=NONE cterm=NONE
hi cPreProc ctermfg=164 ctermbg=NONE cterm=NONE
hi cppSTLfunction ctermfg=252 ctermbg=NONE cterm=NONE
hi cTodo ctermfg=164 ctermbg=NONE cterm=NONE
" "}}}

" Colors from https://www.emacswiki.org/emacs/monokai-theme.el
" foreground-color f8f8f2
" background-color 272822
"
" function a6e22e green
" cursor-color 73d216 - medium chameleon green
" mouse-color 73d216 - medium chameleon green
" constant face 4e9a06 dark green
"
" comment 75715e - dark aluminium
"
" string e6db74 - some weid kind of yellow
"
" string f92672 plum
"
" 855c1b chocolate medium
"
" variable name fd971f orange (not used currently)
"
" pre-processor 66d9ef sky blue
" lock type face 66d9ef sky blue
