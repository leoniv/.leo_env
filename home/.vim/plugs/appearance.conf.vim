" Bundle "skwp/vim-colors-solarized"
colorscheme solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_contrast="low"
let g:solarized_visibility="low"

"Bundle "itchyny/lightline.vim"

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'filename': 'MyFilename',
      \ } }

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
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


" Bundle "xsunsmile/showmarks.git"
" Tell showmarks to not include the various brace marks (),{}, etc
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY"
