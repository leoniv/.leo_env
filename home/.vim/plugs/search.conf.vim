" Bundle "sjl/gundo.vim"

nmap <leader>u :GundoToggle<CR>

" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1

" a little wider for wider screens
let g:gundo_width = 60

" Bundle "majutsushi/tagbar"
nmap <F12> :TagbarToggle<CR>

function s:SetUniteParams()

endfunction
call s:SetUniteParams()
