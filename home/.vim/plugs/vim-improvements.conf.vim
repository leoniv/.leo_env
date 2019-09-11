" Bundle "svermeulen/vim-easyclip"
" Resolves collision with marks

let g:EasyClipUseCutDefaults = 0

nmap c <Plug>MoveMotionPlug
xmap c <Plug>MoveMotionXPlug
nmap cc <Plug>MoveMotionLinePlug

" Directrly system clipboard
set clipboard=unnamed

