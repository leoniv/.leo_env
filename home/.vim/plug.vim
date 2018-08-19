call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

set rtp+=~/.vim/plugs/ "Submodules
runtime appearance.plug
runtime git.plug
runtime languages.plug
runtime vim-improvements.plug
runtime comleters.plug
runtime ruby.plug
runtime web.plug
runtime project.plug
runtime search.plug

call plug#end()
