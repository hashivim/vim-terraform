## Overview: vim-terramate

This plugin provides the following features:

* Syntax highlighting for terramate files (`*.tm.hcl` and `*.tm`)
* Language server integration with [terramate-ls](https://github.com/terramate-io/terramate/tree/main/cmd/terramate-ls) via [vim-lsp](https://github.com/prabirshrestha/vim-lsp)
* `:Terramate` command that runs terramate, with tab completion of subcommands.

---

## Installation

### With vim-plug

* Install [vim-plug](https://github.com/junegunn/vim-plug)
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
