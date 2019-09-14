function s:SetUniteParams()
  " Автоматический insert mode
  let g:unite_enable_start_insert = 1
  " Отображаем Unite в нижней части экрана
  let g:unite_split_rule = "botright"
  " Отключаем замену статус строки
  let g:unite_force_overwrite_statusline = 0
  " Размер окна Unite
  let g:unite_winheight = 10
  " Красивые стрелочки
  let g:unite_candidate_icon="▷"
  let g:unite_source_history_yank_enable = 1

  command! Buffers :Unite buffer -buffer-name=buffers
  command! Files :Unite file -buffer-name=files
  command! Tabs :Unite tab -buffer-name=tabs
  command! Windows :Unite window -buffer-name=windows
  command! Mappings :Unite mapping -buffer-name=keys-mappings
  nnoremap <leader>f :<C-u>Unite -buffer-name=unite-find -start-insert buffer window file_rec/async:!<cr>
endfunction
call s:SetUniteParams()
