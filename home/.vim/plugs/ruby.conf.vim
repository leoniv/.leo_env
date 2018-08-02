:let ruby_foldable_groups = 'class module def do if { [ #'
if executable('solargraph') || filereadable('/home/leo/bin/solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
else
  " Plug 'yami-beta/asyncomplete-omni.vim'
  call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
  \ 'name': 'ruby_omni',
  \ 'whitelist': ['ruby'],
  \ 'completor': function('asyncomplete#sources#omni#completor')
  \  }))
endif
"if executable('language_server-ruby')
"    " gem install language_server-ruby
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'language_server-ruby',
"        \ 'cmd': {server_info->['language_server-ruby']},
"        \ 'whitelist': ['ruby'],
"        \ })
"endif
