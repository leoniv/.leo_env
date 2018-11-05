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

" npm i -g bash-language-server
if executable('bash-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
        \ 'whitelist': ['sh'],
        \ })
endif

if !exists('g:gui_oni')
  " Haskell https://github.com/haskell/haskell-ide-engine
  if executable('hie')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'haskell-ide-engine',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'stack exec -- hie --lsp']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(systemlist('git rev-parse --show-toplevel')[0])},
      \ 'whitelist': ['haskell']
      \ })
  endif
endif
