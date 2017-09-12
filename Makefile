TERM=xterm
HOME=/dev/null
VIMINIT=

check: vader.vim
	bash -c 'vim -Nu <( echo "set rtp+=vader.vim,.,./after | filetype plugin indent on | syntax enable") -c "silent Vader! test/*"'

vader.vim:
	git clone https://github.com/junegunn/vader.vim.git
