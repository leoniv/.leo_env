function s:VebuggerSetParams() abort
  let g:vebugger_leader = '<Leader>d'
  let g:vebugger_breakpoint_text='**'
  let g:vebugger_currentline_text='->'
endfunction
call s:VebuggerSetParams()

"/home/leo/.sdkman/candidates/java/9.0.4-open/bin/java -Dorg.gradle.native=false -agentlib:jdwp=transport=dt_socket,server=n,suspend=y,address=3616 @/tmp/gradle-worker-classpath9941992160825235997txt -Xmx512m -Dfile.encoding=UTF-8 -Duser.country=RU -Duser.language=ru -Duser.variant -ea worker.org.gradle.process.internal.worker.GradleWorkerMain 'Gradle Test Executor 12'
function s:jdbAttach(addr) abort
  call vebugger#jdb#attach(a:addr)
endfunction

function s:VebuggerJavaCommans()
  command! -nargs=+ -complete=file VBGattachJDB call s:jdbAttach([<f-args>][0])
endfunction
call s:VebuggerJavaCommans()
