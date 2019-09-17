function s:SetTagBarMapping() abort
  nmap <F12> :TagbarToggle<CR>
endfunction
call s:SetTagBarMapping()

function s:SetFlyGrepMapping() abort
  nnoremap <leader>g :FlyGrep<cr>
endfunction
call s:SetFlyGrepMapping()
