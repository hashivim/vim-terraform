let s:cpo_save = &cpoptions
set cpoptions&vim

function! hcl#align() abort
  if !( exists(':Tabularize') || exists(':EasyAlign') )
    return
  endif

  let p = '^.*=[^>]*$'
  if getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
    if exists(':Tabularize')
      Tabularize/=.*/l1
    elseif exists(':EasyAlign')
      let l:winview = winsaveview()
      :?^[^=]*$?,/^[^=]*$/ EasyAlign =
      call winrestview(l:winview)
    endif
    normal! 0
    call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

let &cpoptions = s:cpo_save
unlet s:cpo_save
