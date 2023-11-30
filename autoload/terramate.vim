let s:cpo_save = &cpoptions
set cpoptions&vim

function! terramate#fmt() abort
  silent execute 'w !'.g:terramate_binary_path.' fmt'
  if v:shell_error == 0
    return
  endif
endfunction

function! terramate#commands(ArgLead, CmdLine, CursorPos) abort
  let commands = [
    \ 'list',
    \ 'run',
    \ 'version',
    \ 'create',
    \ 'generate'
  \ ]
  return join(commands, "\n")
endfunction

let &cpoptions = s:cpo_save
unlet s:cpo_save
