[![](https://img.shields.io/badge/Supports%20Terraform%20Version-%3E%3D1.0.0-blue.svg)](https://github.com/hashicorp/terraform/blob/v1.0.0/CHANGELOG.md)

## Call For Maintainers

This plugin, along with others like it, is now maintained by the
[HashiVim](http://hashivim.github.io/) organization, which is looking for
additional maintainers and contributors.
See the HashiVim home page for further information.

---

## Overview: vim-terraform

This plugin adds a `:Terraform` command that runs terraform, with tab completion
of subcommands.
It also sets up `*.hcl`, `*.tf`, `*.tfvars`, `.terraformrc` and `terraform.rc`
files to be highlighted as HCL and `*.tfstate` as JSON.

---

## Installation

With [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages):

    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform

With [Pathogen](https://github.com/tpope/vim-pathogen):

    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/bundle/vim-terraform

With [Vundle](https://github.com/VundleVim/Vundle.vim), add the following to `~/.vimrc`:

    Plugin 'hashivim/vim-terraform'

---

## Usage

Settings are documented in the [help](doc).

---

## Updating vim-terraform

Note, this is only for maintainers of the `vim-terraform` project.

When a new version of Terraform drops, you can run the following where x.x.x is
a version such as 0.11.11

    ./update_automagic.sh x.x.x

At this point, add the modified files to a git branch and open a pull request.

    git checkout -b "feature/update-to-terraform-$VERSION"
    git add $FILE
    git commit -m "Message about update"
    git push

Add another maintainer to the pull request and await confirmation.

---

## Running tests

To run the test suite and verify functionality

    make

---

## Credits

Syntax highlighting and indentation by Kevin Le (@bkad) based on prior work by
Larry Gilbert (@L2G).
The rest originally written by Mark Cornick <https://www.markcornick.com/> and
contributors listed below.
Licensed under the ISC license.

Thanks to the following contributors:

- michael j talarczyk (@mijit)
- Koji Nakayama (@knakayama)
- Kris (@kostecky)
- Okumura Takahiro (@hfm)
- Paul Forman (@pforman)
- Lowe Schmidt (@lsc)
- Mario Kozjak (@mkozjak)

The `:TerraformFmt` command is adapted from
[vim-hclfmt](https://github.com/fatih/vim-hclfmt/blob/master/autoload/fmt.vim).

This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.
