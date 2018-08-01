" Plug 'prabirshrestha/asyncomplete.vim'

imap <Tab> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_auto_popup = 0

" Plug 'prabirshrestha/asyncomplete-lsp.vim'
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')

" Plag 'prabirshrestha/asyncomplete-buffer.vim'
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

" Plug 'yami-beta/asyncomplete-omni.vim'
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'whitelist': ['*'],
\ 'blacklist': ['c', 'cpp', 'html', 'ruby'],
\ 'completor': function('asyncomplete#sources#omni#completor')
\  }))

