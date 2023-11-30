" terramate.vim - basic vim/terramate integration
if exists('b:did_ftplugin') || v:version < 700 || &compatible
  finish
endif

runtime! ftplugin/terraform.vim

if !exists('g:terramate_binary_path')
  let g:terramate_binary_path='terramate'
endif

if !executable(g:terramate_binary_path)
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

command! -nargs=+ -complete=custom,terramate#commands -buffer Terramate
  \ execute '!'.g:terramate_binary_path.' '.<q-args>

command! -nargs=0 -buffer TerramateFmt call terramate#fmt()
let b:undo_ftplugin .= '|delcommand Terramate|delcommand TerramateFmt'

if executable('terramate-ls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'terramate-ls',
      \ 'cmd': {server_info->['terramate-ls']},
      \ 'allowlist': ['terramate'],
      \ })
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_diagnostics_highlights_enabled = 1
  let g:lsp_diagnostics_virtual_text_enabled = 1
  let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
  let g:lsp_diagnostics_virtual_text_padding_left = 1
  let g:lsp_diagnostics_virtual_text_align = 'right'
endif

let &cpoptions = s:cpo_save
unlet s:cpo_save
