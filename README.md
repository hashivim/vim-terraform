[![](https://img.shields.io/badge/Supports%20Terraform%20Version-%3E%3D0.11.14-blue.svg)](https://github.com/hashicorp/terraform/blob/v0.11.14/CHANGELOG.md)

# Call For Maintainers

This plugin, along with others like it, is now maintained by the
[HashiVim](http://hashivim.github.io/) organization, which is looking for
additional maintainers and contributors. See the HashiVim home page for
further information.
- - - -
# Overview: vim-terraform

This plugin adds a `:Terraform` command that runs terraform, with tab
completion of subcommands. It also sets up `*.tf`, `*.tfvars`, and
`*.tfstate` files to be highlighted as HCL, HCL, and JSON respectively.

- - - -
# Installation

With [pathogen.vim](https://github.com/tpope/vim-pathogen) just do:

    cd ~/.vim/bundle
    git clone https://github.com/hashivim/vim-terraform.git

For [vundle.vim](https://github.com/VundleVim/Vundle.vim) users, add the following to `~/.vimrc`:

    Plugin 'hashivim/vim-terraform'

If you prefer to use something besides pathogen, go ahead.

- - - -
# Usage

Allow vim-terraform to override your `.vimrc` indentation syntax for matching files. Defaults to 0 which is off.

    let g:terraform_align=1

Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.

    let g:terraform_fold_sections=1

Allow vim-terraform to re-map the spacebar to fold/unfold. This works in conjunction with `let g:terraform_fold_sections=1` which should be enabled if you plan to use this feature. Defaults to 0 which is off.

    let g:terraform_remap_spacebar=1

Override the Vim's `commentstring` setting with a custom value. Defaults to
`#%s`. Example:

    let g:terraform_commentstring='//%s'

Allow vim-terraform to automatically format `*.tf` and `*.tfvars` files with `terraform fmt`.
You can also do this manually with the `:TerraformFmt` command.

    let g:terraform_fmt_on_save=1

- - - -
# Updating vim-terraform
Note, this is only for maintainers of the `vim-terraform` project.

When a new version of Terraform drops, you can run the following where x.x.x is a version such as 0.11.11

    ./update_automagic.sh x.x.x

At this point, add the modified files to a git branch and open a pull request.

	git checkout -b "feature/update-to-terraform-$VERSION"
	git add $FILE
	git commit -m "Message about update"
	git push

Add another maintainer to the pull request and await confirmation.

- - - -
# Running tests

To run the test suite and verify functionality

    make

- - - -
# Credits

Syntax highlighting and indentation by Kevin Le (@bkad) based on prior work by
Larry Gilbert (@L2G). The rest originally written by Mark Cornick
<https://www.markcornick.com/> and contributors listed below. Licensed under the
ISC license.

Thanks to the following contributors:

-   michael j talarczyk (@mijit)
-   Koji Nakayama (@knakayama)
-   Kris (@kostecky)
-   Okumura Takahiro (@hfm)
-   Paul Forman (@pforman)
-   Lowe Schmidt (@lsc)
-   Mario Kozjak (@mkozjak)

The `:TerraformFmt` command is adapted from
[vim-hclfmt](https://github.com/fatih/vim-hclfmt/blob/master/autoload/fmt.vim).

This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.
