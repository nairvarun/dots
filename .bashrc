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

# PS1
# https://ezprompt.net/
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[35m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\] "
# export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[35m\]λ\[\e[m\] "

# sys env vars

# set nvim as default editor
export EDITOR='/usr/bin/nvim'

# bat theme
export BAT_THEME="base16"

# aliases
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
export FZF_DEFAULT_OPTS='--bind=alt-k:up,alt-j:down'

# ripgrep
# search hidden files ignoring .git/
alias rg="rg --hidden --glob '!.git' --glob '!.venv' --glob '!node_modules'"

# fzf and ripgrep ==> nvim
alias eff='fzf -e | xargs -r $EDITOR'
alias erg='rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r $EDITOR'

