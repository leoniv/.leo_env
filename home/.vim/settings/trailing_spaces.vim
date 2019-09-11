let g:auto_trim_trailihg_spaces = 1

function TrimAllTrailingSpaces(force)
  if a:force
    :%s/\s\+$//e
  endif
endfunction

function s:SetHighlightTrailingSpaces()
  highlight ExtraWhitespace ctermbg=red guibg=red
  augroup trailig_spaces_highlighting
      au!
      au VimEnter,WinEnter * match ExtraWhitespace /\s\+$/
  augroup END
endfunction

function s:SetRemoveTrailingSpaces()
  autocmd BufWritePre * call TrimAllTrailingSpaces(g:auto_trim_trailihg_spaces)
endfunction

call s:SetHighlightTrailingSpaces()
call s:SetRemoveTrailingSpaces()
