if exists('b:current_syntax')
  finish
endif
runtime! syntax/terraform.vim
unlet b:current_syntax

syn match terramateFunction "tm_[a-z0-9]\+(\@="

hi def link terramateFunction          Function

let b:current_syntax = 'terramate'
