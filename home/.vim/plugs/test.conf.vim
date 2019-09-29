function s:gitLs() abort
  if executable('git')
    return system('git ls-files')
  endif
  return ""
endfunction

function s:TestJavaDetectGradle() abort
  return s:gitLs() =~ 'build.gradle'
endfunction

function s:TestJavaRunnerGet() abort
  if s:TestJavaDetectGradle()
    return 'gradletest'
  endif
  return 'maventest'
endfunction

function s:VimTestSetParams() abort
  let g:test#strategy = 'basic'
  let g:test#java#runner = s:TestJavaRunnerGet()
endfunction
call s:VimTestSetParams()
