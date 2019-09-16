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
  command! RenameCurrent :CocCommand document.renameCurrentWord
endfunction
call s:DefineCommands()
