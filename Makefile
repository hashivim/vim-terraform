.PHONY: test test_deps
.ONESHELL:
.DEFAULTGOAL := test
SHELL := /bin/bash
TERM := xterm
HOME := /dev/null
VIMINIT :=

test: test_deps
	bash -c 'vim -Nu <( echo "set rtp+=vader.vim,.,./after | filetype plugin indent on | syntax enable") -c "silent Vader! test/*"'

test_deps:
	command -v git; \
	RETVAL=$$?; \
	if [ $$RETVAL != 0 ]; then echo "$$(tput bold)\`git\` executable was not found on the PATH. Please install \`git\`.$$(tput sgr0)"; exit 1; fi; \
	if [ ! -d vader.vim ]; then	git clone https://github.com/junegunn/vader.vim.git; fi
