" vint: -ProhibitAutocmdWithNoGroup
silent! autocmd! filetypedetect BufRead,BufNewFile *.tm.hcl
autocmd BufRead,BufNewFile *.tm,*.tm.hcl set filetype=terramate
