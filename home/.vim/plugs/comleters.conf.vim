" Plug 'prabirshrestha/asyncomplete.vim'

imap <Tab> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_auto_popup = 0

" Plug 'prabirshrestha/asyncomplete-lsp.vim'
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': "ℹ"}
let g:lsp_signs_hint = {'text': "➤"}

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

