call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

set rtp+=~/.vim/plugs/ "Submodules
runtime appearance.plug

"runtime git.vundle
"runtime languages.vundle
"runtime ruby.vundle
"runtime vim-improvements.vundle
"runtime project.vundle
"runtime search.vundle

call plug#end()
