# vim-terraform

This plugin adds a `:Terraform` command that runs terraform, with tab
completion of subcommands. It also sets up `*.tf` and `*.tfstate` files
to be highlighted as HML (Hashicorp's JSON variant) and JSON respectively.

## Installation

With [pathogen.vim](https://github.com/tpope/vim-pathogen) just do:

    cd ~/.vim/bundle
    git clone git://github.com/markcornick/vim-terraform.git

If you prefer to use something besides pathogen, go ahead.

## Credits

Syntax highlighting and indentation by Kevin Le (@bkad) based on prior work
by Larry Gilbert (@L2G). The rest written by Mark Cornick <mark@cornick.io> by
adapting my prior [vim-vagrant](https://github.com/markcornick/vim-vagrant)
plugin. Licensed under the MIT license.
