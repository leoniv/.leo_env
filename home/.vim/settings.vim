"Plugin settings
for fpath in split(globpath('~/.vim/plugs', '*.conf.vim'), '\n')
  exe 'source' fpath
endfor

"Vim settings
for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor

