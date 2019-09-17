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

function s:SetGundoParams() abort
" Bundle "sjl/gundo.vim"
nmap <leader>u :GundoToggle<CR>
  " open on the right so as not to compete with the nerdtree
  let g:gundo_right = 1
  " a little wider for wider screens
  let g:gundo_width = 60
endfunction
call s:SetGundoParams()
