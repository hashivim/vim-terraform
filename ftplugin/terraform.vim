" terraform.vim - basic vim/terraform integration
" Maintainer: HashiVim <https://github.com/hashivim>

if exists('b:did_ftplugin') || v:version < 700 || &compatible || !executable('terraform')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

setlocal formatoptions-=t

if !exists('g:terraform_fmt_on_save') || !filereadable(expand('%:p'))
  let g:terraform_fmt_on_save = 0
endif

function! s:commands(A, L, P)
  return [
  \ 'apply',
  \ 'console',
  \ 'destroy',
  \ 'env',
  \ 'fmt',
  \ 'get',
  \ 'graph',
  \ 'import',
  \ 'init',
  \ 'output',
  \ 'plan',
  \ 'providers',
  \ 'push',
  \ 'refresh',
  \ 'show',
  \ 'taint',
  \ 'untaint',
  \ 'validate',
  \ 'version',
  \ 'workspace',
  \ '0.12checklist',
  \ 'debug',
  \ 'force-unlock',
  \ 'state'
  \ ]
endfunction

augroup terraform
  autocmd!
  autocmd BufEnter *
        \ command! -nargs=+ -complete=customlist,s:commands Terraform execute '!terraform '.<q-args>. ' -no-color'
  autocmd BufEnter * command! -nargs=0 TerraformFmt call terraform#fmt()
  if get(g:, 'terraform_fmt_on_save', 1)
    autocmd BufWritePre *.tf call terraform#fmt()
    autocmd BufWritePre *.tfvars call terraform#fmt()
  endif
augroup END

let b:undo_ftplugin = 'setlocal formatoptions<'

let &cpoptions = s:cpo_save
unlet s:cpo_save
