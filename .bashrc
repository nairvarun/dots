# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc



# my config

# set nvim as default editor
export EDITOR='/usr/bin/nvim'

# so that tmux uses 256 colors
alias tmux='TERM=xterm-256color tmux'

# gvim has system clipboard support
# alias vim='gvim -v'

# g ==> git
alias g='git'

# python venv 
# venv ==> activate/deactivate .venv and make .venv if it does't exist
pyvenv()
{
    if [ "$VIRTUAL_ENV" == "" ] 
    then
        if [ -d "./.venv/" ] && [ -d "./.git/" ]
        then
            source ./.venv/bin/activate
        elif [ -d "./.git/" ]
        then
            python -m venv .venv && source ./.venv/bin/activate
        fi
    else
        deactivate
    fi
}
alias venv=pyvenv

# fzf
# search hidden files ignoring .git/
export FZF_DEFAULT_COMMAND="find \( -name ".venv" -o -name ".git" -o -name "node_modules" \) -prune -o -print"

# ripgrep
# search hidden files ignoring .git/
alias rg="rg --hidden --glob '!.git' --glob '!.venv' --glob '!node_modules'"

# fzf and ripgrep ==> nvim
alias nff='fzf -e | xargs -r $EDITOR'
alias nrg='rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r $EDITOR'

