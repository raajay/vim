set autoread
if has("autocmd")
    au FocusGained,BufEnter *.lst :silent! checktime
endif
