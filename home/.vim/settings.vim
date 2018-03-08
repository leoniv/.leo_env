let pluginsettings = '~/.vim/vundles'
"
for fpath in split(globpath(pluginsettings, '*.conf.vim'), '\n')
  exe 'source' fpath
endfor
