" ========================================
" Vim plugin configuration
" ========================================

" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

runtime appearance.vundle
runtime git.vundle
runtime languages.vundle
runtime ruby.vundle
runtime vim-improvements.vundle
runtime project.vundle
runtime search.vundle

filetype plugin indent on
