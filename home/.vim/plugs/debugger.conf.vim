function s:VebuggerSetParams() abort
  let g:vebugger_leader = '<Leader>d'
endfunction
call s:VebuggerSetParams()

function s:jdbAttach(addr) abort
  call vebugger#jdb#attach(a:addr)
endfunction

function s:VebuggerJavaCommans()
  command! -nargs=+ -complete=file VBGattachJDB call s:jdbAttach([<f-args>][0])
endfunction
call s:VebuggerJavaCommans()
