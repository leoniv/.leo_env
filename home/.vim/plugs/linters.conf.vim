function s:SetNeomakeConfig()
  call neomake#configure#automake('w')
  let g:neomake_cursormoved_delay = 300
  let g:neomake_echo_current_error = 1
  let g:neomake_error_sign = {'texthl': 'GruvboxRedSign', 'text': '✖'}
  let g:neomake_info_sign = {'texthl': 'GruvboxYellowSign', 'text': 'ⓘ'}
  let g:neomake_java_javac_delete_output = 1
  let g:neomake_open_list = 2
  let g:neomake_place_signs = 1
  let g:neomake_verbose = 0
  let g:neomake_virtualtext_current_error = 1
  let g:neomake_warning_sign = {'texthl': 'GruvboxYellowSign', 'text': '⚠'}
endfunction
call s:SetNeomakeConfig()
