" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal smartindent

" override the tf.vim indent file
set indentexpr=

" prevent # from being shunted to the first column
inoremap # X#
