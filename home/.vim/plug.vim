call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

set rtp+=~/.vim/plugs/ "Submodules
runtime libs.plug
runtime coc.plug
runtime unite.plug
runtime appearance.plug
runtime vim-improvements.plug
runtime git.plug
runtime linters.plug
runtime lang.other.plug
runtime project.plug
runtime search.plug
runtime test.plug
runtime lang.java.plug

call plug#end()
