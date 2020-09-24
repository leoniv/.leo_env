function s:SetTagBarMapping() abort
  nmap <F12> :TagbarToggle<CR>
endfunction
call s:SetTagBarMapping()

" Require install coc-lists
function s:SetCocListGrepMapping() abort
  nnoremap <leader>g :CocList grep<cr>
endfunction
call s:SetCocListGrepMapping()
