" terraform.vim - basic vim/terraform integration
" Maintainer: Mark Cornick <https://github.com/markcornick>

if exists("g:loaded_terraform") || v:version < 700 || &cp || !executable('terraform')
  finish
endif
let g:loaded_terraform = 1

function! s:commands(A, L, P)
  return join([
  \ "apply",
  \ "destroy",
  \ "get",
  \ "graph",
  \ "init",
  \ "output",
  \ "plan",
  \ "pull",
  \ "push",
  \ "refresh",
  \ "remote",
  \ "show",
  \ "version"
  \ ], "\n")
endfunction

augroup terraform
  autocmd!
  autocmd VimEnter *
        \ command! -nargs=+ -complete=custom,s:commands Terraform execute '!terraform '.<q-args>
augroup END

" vim:set et sw=2:
