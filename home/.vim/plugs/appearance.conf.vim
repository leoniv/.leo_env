function s:SetColorSchemParam() abort
  set background=dark
  colorscheme gruvbox-material
endfunction
call s:SetColorSchemParam()

"Bundle "itchyny/lightline.vim"
function s:SetLightLineParams()
  let g:lightline = {
        \ 'colorscheme': 'gruvbox',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'coc_status', 'fugitive', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'coc_status': 'coc#status',
        \   'fugitive': 'MyFugitive',
        \   'readonly': 'MyReadonly',
        \   'filename': 'MyFilename',
        \ } }

  function! MyReadonly()
    if &filetype == "help"
      return ""
    elseif &readonly
      return "RO"
    else
      return ""
    endif
  endfunction

  function! MyFugitive()
    if exists("*fugitive#head")
      let _ = fugitive#head()
      return _
    endif
    return ''
  endfunction

  function! MyFilename()
    return ('' != expand('%') ? expand('%') : '[NoName]')
  endfunction
  " Use status bar even with single buffer
  set laststatus=2
endfunction
call s:SetLightLineParams()

" Bundle "xsunsmile/showmarks.git"
function s:SetShowMarksParams()
  let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"
endfunction
call s:SetShowMarksParams()

