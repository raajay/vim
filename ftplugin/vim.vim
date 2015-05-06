" block indent
map <buffer> > :s/^/\ \ \ \ /<CR>
map <buffer> < :s/^\ \ \ \ //<CR>

" commenting
map <buffer> // :s/^/"/<CR>
map <buffer> \\ :s/^\(\s*\)"/\1/<CR>
