" commenting
map <buffer> // :s/^/\*\ /<CR>
map <buffer> \\ :s/^\s*\*\ //<CR>

setlocal textwidth=80

map <buffer> <leader>rr <Esc>:!gams %<cr>
map <buffer> <leader>ll <Esc>:split %:r.lst<cr>
