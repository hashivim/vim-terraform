[![](https://img.shields.io/badge/Supports%20Terraform%20Version-%3E%3D1.0.0-blue.svg)](https://github.com/hashicorp/terraform/blob/v1.0.0/CHANGELOG.md)

## Overview: vim-terramate

This plugin adds a `:Terramate` command that runs terramate, with tab completion
of subcommands.
It also provides syntax highlighting, indentation and more for HCL and
Terramate-related files.

---

## Installation

### With [Vim packages](http://vimhelp.appspot.com/repeat.txt.html#packages):

```
git clone https://github.com/wmalik/vim-terramate.git ~/.vim/pack/plugins/start/vim-terramate
```

### With [Vim plug](https://github.com/junegunn/vim-plug):

* Install vim-plug
* Add this to your vimrc

```vimscript
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'wmalik/vim-terramate'
call plug#end()
```

---

## Usage

Settings are documented in the [help](doc).

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
