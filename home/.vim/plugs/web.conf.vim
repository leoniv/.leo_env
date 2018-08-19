" npm i -g javascript-typescript-langserver
if executable('javascript-typescript-stdio')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript-typescript-language',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
        \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
        \ })
endif

" npm i -g vscode-html-languageserver-bin
if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'html-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
        \ 'whitelist': ['html', 'css', 'scss']
        \ })
endif

" Plug 'mattn/emmet-vim'
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-x>'
