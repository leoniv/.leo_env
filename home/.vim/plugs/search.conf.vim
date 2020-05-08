function s:SetTagBarMapping() abort
  nmap <F12> :TagbarToggle<CR>
endfunction
call s:SetTagBarMapping()

function s:SetFlyGrepMapping() abort
  nnoremap <leader>g :FlyGrep<cr>
  let g:spacevim_data_dir = '~/.cache'
endfunction
call s:SetFlyGrepMapping()
