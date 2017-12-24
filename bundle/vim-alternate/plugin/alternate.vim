" File:        plugin/alternate.vim
" Version:     1.0
" Modified:    2017-12-23
" Description: This plugin opens alternate file
" Maintainer:  Raajay Viswanathan (raajay.v@gmail.com)
" Manual:      Read ":help alternate".
" ============================================================================
"
" Initialization: {{{
if exists("g:loaded_alternate")
    finish
endif
let g:loaded_alternate = 1

if v:version < 700
    echoerr "vim-alternate: this plugin requires vim >= 7!"
    finish
endif

let s:loaded_alternate = 1
" }}}

" Functions: {{{

function! s:get_alternate() "{{{
    let l:extension = expand('%:e')
    let l:basename = expand('%:r')
    let l:alternate_filename = ""
    if l:extension == "cpp"
        let l:alternate_filename = l:basename . '.hpp'
    elseif l:extension == "hpp"
        let l:alternate_filename = l:basename . '.cpp'
    endif
    return l:alternate_filename
endfunction "}}}

function! s:open_split(filename) "{{{
    if filereadable(a:filename)
        execute 'split' a:filename
    endif
endfunction "}}}

function! s:open_vsplit(filename) "{{{
    if filereadable(a:filename)
        execute 'vsplit' a:filename
    endif
endfunction "}}}
"}}}

" Commands: {{{

command! -bar AlternateSplit call s:open_split(s:get_alternate())
command! -bar AlternateVSplit call s:open_vsplit(s:get_alternate())
"}}}
