" Bundle "skwp/vim-colors-solarized"
function s:SetSolarizedSchemeParams()
  colorscheme solarized
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_contrast="low"
  let g:solarized_visibility="low"
endfunction
"call s:SetSolarizedSchemeParams()

function s:SetGruvBoxColorParam() abort
  colorscheme gruvbox
endfunction
call s:SetGruvBoxColorParam()

"Bundle "itchyny/lightline.vim"
function s:SetLightLineParams()
  let g:lightline = {
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
    :q
    :q
      return "⭤ "
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
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
         \ ('' != expand('%') ? expand('%') : '[NoName]')
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

