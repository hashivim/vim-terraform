" vint: -ProhibitAutocmdWithNoGroup
" By default, Vim associates .tf files with TinyFugue - tell it not to.
silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.tf,*.tfvars,.terraformrc,terraform.rc set filetype=hcl.terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
