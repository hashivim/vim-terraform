" vint: -ProhibitAutocmdWithNoGroup
" By default, Vim associates .tf files with TinyFugue - tell it not to.
silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.hcl,*.tfbackend set filetype=hcl
autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
autocmd BufRead,BufNewFile *.tf,*.tfvars,*.tftest.hcl set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
