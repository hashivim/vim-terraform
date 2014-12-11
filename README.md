# vim-terraform

This plugin adds a `:Terraform` command that runs terraform, with tab
completion of subcommands.

This plugin no longer sets up highlighting for `*.tf` and `*.tfstate`
files. For the time being, please see [bkad's
plugin](https://github.com/bkad/vim-terraform.git) for that. I'm
awaiting bkad's permission to merge his plugin into this one.

## Installation

With [pathogen.vim](https://github.com/tpope/vim-pathogen) just do:

    cd ~/.vim/bundle
    git clone git://github.com/markcornick/vim-terraform.git

If you prefer to use something besides pathogen, go ahead.

## Credits

Written by Mark Cornick <mark@cornick.io> by adapting my prior
[vim-vagrant](https://github.com/markcornick/vim-vagrant) plugin. Licensed
under the MIT license.
