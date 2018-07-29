" Bundle "xolox/vim-session"
:let g:session_autosave = 'no'
:let g:session_autoload = 'no'

" Bundle "scrooloose/nerdtree.git"

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
nmap <Tab> :NERDTreeToggle <CR>

" Bundle "jistr/vim-nerdtree-tabs.git"

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

" Bundle "majutsushi/tagbar"
nmap <F12> :TagbarToggle<CR>
