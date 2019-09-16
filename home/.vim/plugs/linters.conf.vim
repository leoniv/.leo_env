function s:SetNeomakeConfig()
  call neomake#configure#automake('w')
  let g:neomake_cursormoved_delay = 300
  let g:neomake_echo_current_error = 1
  let g:neomake_error_sign = {
     \ 'text': '✖',
     \ 'texthl': 'NeomakeWarningSign',
     \ }
  let g:neomake_warning_sign = {
     \   'text': '‼',
     \   'texthl': 'NeomakeWarningSign',
     \ }
  let g:neomake_message_sign = {
      \   'text': '➤',
      \   'texthl': 'NeomakeMessageSign',
      \ }
  let g:neomake_info_sign = {
      \ 'text': 'ℹ',
      \ 'texthl': 'NeomakeInfoSign'
      \ }
  let g:neomake_open_list = 0
  let g:neomake_place_signs = 1
  let g:neomake_verbose = 0
  let g:neomake_virtualtext_current_error = 1
  command Errors lopen
endfunction
call s:SetNeomakeConfig()

function s:NeomakeDisableForJava()
  augroup neomake_java
    au!
    au FileType java :NeomakeDisableBuffer
  augroup END
endfunction
call s:NeomakeDisableForJava()

function s:NeomakeDisableForRuby()
  augroup neomake_ruby
    au!
    au FileType ruby :NeomakeDisableBuffer
  augroup END
endfunction
call s:NeomakeDisableForRuby()
