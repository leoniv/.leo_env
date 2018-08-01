:let ruby_foldable_groups = 'class module def do if { [ #'
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->['solargraph', 'stdio']},
        \ 'whitelist': ['ruby'],
        \ })
endif
"if executable('language_server-ruby')
"    " gem install language_server-ruby
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'language_server-ruby',
"        \ 'cmd': {server_info->['language_server-ruby']},
"        \ 'whitelist': ['ruby'],
"        \ })
"endif
