" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function s:SetTabRemap() abort
  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
endfunction
call s:SetTabRemap()

function s:DefineCommands() abort
  augroup coccommand
    command! RenameCurrent :CocCommand document.renameCurrentWord
    command! -nargs=0 Format :call CocAction('format')
    autocmd User CocJumpPlaceholder call CocAction('showSignatureHelp')
  augroup END
endfunction
call s:DefineCommands()

function s:SetCocMapping() abort
  nmap <leader>i <Plug>(coc-diagnostic-info)
  nmap ]i <Plug>(coc-diagnostic-next)
  nmap [i <Plug>(coc-diagnostic-prev)
  nmap gD <Plug>(coc-declaration)
  nmap gd <plug>(coc-definition)
  nmap gi <plug>(coc-implementation)
  nmap gt <Plug>(coc-type-definition)
  nmap gr <Plug>(coc-references)
  nmap gh :call CocAction('doHover')<CR>
  nmap gs :call CocActionAsync('showSignatureHelp')<CR>
  vmap gs :call CocActionAsync('showSignatureHelp')<CR>
  vmap <leader>F <Plug>(coc-format-selected)
  nmap <leader>F <Plug>(coc-format-selected)
  nmap <leader>r <Plug>(coc-rename)
  nmap <leader>R <Plug>(coc-refactor)
  nmap <Leader>a <Plug>(coc-codeaction)
  vmap <Leader>a <Plug>(coc-codeaction-selected)
  nmap <Leader>o <Plug>(coc-openlink)
  nmap <Leader>l <Plug>(coc-codelens-action)
  nmap <leader>qf <Plug>(coc-fix-current)
  vmap <Leader>sr <Plug>(coc-range-select)
  nmap <Leader>ws <Plug>(coc-metals-expand-decoration)
endfunction
call s:SetCocMapping()
