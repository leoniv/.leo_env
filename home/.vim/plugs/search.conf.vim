" Find files using Telescope command-line sugar.
function s:TelescopeMapping() abort
  nnoremap <leader>g <cmd>Telescope live_grep theme=get_cursor<cr>
  nnoremap gr <cmd>Telescope lsp_references<cr>
  nnoremap gi <cmd>Telescope lsp_implementations<cr>
  nnoremap gd <cmd>Telescope lsp_definitions<cr>
  nnoremap gD <cmd>Telescope lsp_definitions<cr>
endfunction
call s:TelescopeMapping()
