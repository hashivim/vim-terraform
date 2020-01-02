" By default, Vim associates .tf files with TinyFugue - tell it not to.
augroup filetypedetect
  au BufRead,BufNewFile *.tf set filetype=terraform
augroup END

autocmd BufRead,BufNewFile *.tf set filetype=terraform
autocmd BufRead,BufNewFile *.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate set filetype=json
autocmd BufRead,BufNewFile *.tfstate.backup set filetype=json
