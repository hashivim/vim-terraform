" terraform.vim - basic vim/terraform integration
" Maintainer: HashiVim <https://github.com/hashivim>

if exists('b:did_ftplugin') || v:version < 700 || &compatible
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

setlocal formatoptions-=t
let b:undo_ftplugin = 'setlocal formatoptions<'

" Include hyphens as keyword characters so that a keyword appearing as part of
" a longer name doesn't get partially highlighted.
setlocal iskeyword+=-
let b:undo_ftplugin .= ' iskeyword<'

if get(g:, 'terraform_fold_sections', 0)
  function! TerraformFolds()
    let thisline = getline(v:lnum)
    if match(thisline, '^resource') >= 0
      return '>1'
    elseif match(thisline, '^provider') >= 0
      return '>1'
    elseif match(thisline, '^module') >= 0
      return '>1'
    elseif match(thisline, '^variable') >= 0
      return '>1'
    elseif match(thisline, '^output') >= 0
      return '>1'
    elseif match(thisline, '^data') >= 0
      return '>1'
    elseif match(thisline, '^terraform') >= 0
      return '>1'
    elseif match(thisline, '^locals') >= 0
      return '>1'
    else
      return '='
    endif
  endfunction
  setlocal foldmethod=expr
  setlocal foldexpr=TerraformFolds()
  setlocal foldlevel=1
  let b:undo_ftplugin .= ' foldmethod< foldexpr< foldlevel<'

  function! TerraformFoldText()
    let foldsize = (v:foldend-v:foldstart)
    return getline(v:foldstart).' ('.foldsize.' lines)'
  endfunction
  setlocal foldtext=TerraformFoldText()
  let b:undo_ftplugin .= ' foldtext<'
endif

" Set the commentstring
let &l:commentstring = get(g:, 'terraform_commentstring', '#%s')
let b:undo_ftplugin .= ' commentstring<'

" Re-map the space bar to fold and unfold
if get(g:, 'terraform_remap_spacebar', 0)
  nnoremap <buffer> <space> za
  onoremap <buffer> <space> <C-C>za
  vnoremap <buffer> <space> zf
  let b:undo_ftplugin .= '|unmap <buffer> <space>'
endif

if get(g:, 'terraform_align', 0) && exists(':Tabularize')
  inoremap <buffer> <silent> = =<Esc>:call <SID>terraformalign()<CR>a
  let b:undo_ftplugin .= '|iunmap <buffer> ='
  function! s:terraformalign()
    let p = '^.*=[^>]*$'
    if exists(':Tabularize') && getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
      Tabularize/=/l1
      normal! 0
      call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction
endif

let &cpoptions = s:cpo_save
unlet s:cpo_save

if !executable('terraform')
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

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

command! -nargs=+ -complete=customlist,s:commands -buffer Terraform execute '!terraform '.<q-args>. ' -no-color'
command! -nargs=0 -buffer TerraformFmt call terraform#fmt()
let b:undo_ftplugin .= '|delcommand Terraform|delcommand TerraformFmt'

if get(g:, 'terraform_fmt_on_save', 0)
  augroup terraform
    autocmd!
    autocmd BufWritePre *.tf call terraform#fmt()
    autocmd BufWritePre *.tfvars call terraform#fmt()
  augroup END
endif

let &cpoptions = s:cpo_save
unlet s:cpo_save
