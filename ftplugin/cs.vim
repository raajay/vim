" omnisharp -- Migrated to using OmniSharp through YouCompleteMe
"let g:OmniSharp_timeout = 1
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1
"set completeopt=longest,menuone,preview
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
"augroup omnisharp_commands
"    autocmd!
"    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
"    autocmd BufEnter, TextChanged,InsertLeave *.cs SyntasticCheck
"
"    " automatically add file to project
"    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"    "
"    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
"    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
"    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
"    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
"    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
"    " still incomplete
"augroup END
