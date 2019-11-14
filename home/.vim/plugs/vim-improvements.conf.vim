function s:SetEacyClipParams() abort
  " Bundle "svermeulen/vim-easyclip"
  " Resolves collision with marks

  let g:EasyClipUseCutDefaults = 0

  nmap c <Plug>MoveMotionPlug
  xmap c <Plug>MoveMotionXPlug
  nmap cc <Plug>MoveMotionLinePlug

  " Directrly system clipboard
  set clipboard=unnamed
endfunction
call s:SetEacyClipParams()

function s:SetUndoPluginMapping() abort
  nmap <leader>u :UndotreeToggle<CR>
endfunction
call s:SetUndoPluginMapping()

function s:SetUndotreeParams() abort
 let g:undotree_SplitWidth = 30
endfunction

function s:TranslateShellParams() abort
  g:trans_default_direction=ru
  g:trans_default_engine=ru
endfunction
