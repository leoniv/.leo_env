function s:JavapSyntaxEnable() abort
  au BufNewFile,BufRead *.javap setf java
endfunction
call s:JavapSyntaxEnable()
