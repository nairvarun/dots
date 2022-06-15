# .bashrc

### default feddora config ###

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

[ -f "/home/nv/.ghcup/env" ] && source "/home/nv/.ghcup/env" # ghcup-env

alias luamake=/home/nv/.local/devel/lua-language-server/3rd/luamake/luamake

### my config ###

## path
export PATH="$HOME/.local/bin:$HOME/bin:$HOME/.local/devel/lua-language-server/bin:$PATH"

# PS1 ( https://ezprompt.net/ )

# get current branch in git repo
function parse_git_branch {
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
export EDITOR='/usr/local/bin/nvim'

# bat theme
export BAT_THEME="base16"

# vi mode
set -o vi

# so that tmux uses 256 colors
alias tmux='TERM=xterm-256color tmux'

## gvim has system clipboard support
# alias vim='gvim -v'

# g ==> git
alias g='git'

# t ==> tmux
alias t='tmux'

# to make lisp repls bearable
alias sbcl='rlwrap sbcl'
alias csi='rlwrap csi'

# python venv 
# venv ==> activate/deactivate .venv and make .venv if it does't exist
pyvenv()
{
    if [ "$VIRTUAL_ENV" == "" ] 
    then
        if [ -d "./.venv/" ]
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

# requirements.txt
alias pipr="pip install -r requirements.txt"

# ipython
alias ipython="ipython --no-banner --InteractiveShell.editing_mode=vi"
# alias ipython="ipython --no-banner --InteractiveShell.editing_mode=vi --InteractiveaShellApp.extensions="['autoreload']""


# fzf
# colors + search hidden files ignoring .git/
export FZF_DEFAULT_COMMAND="find \( -name '.venv' -o -name '.git' -o -name 'node_modules' \) -prune -o -print"
# --preview '(bat {} --style numbers,changes --color=always--style numbers,changes --color=always || tree {}) 2> /dev/null' \
export FZF_DEFAULT_OPTS="--bind=alt-k:up,alt-j:down,alt-K:preview-page-up,alt-J:preview-page-down \
						 --color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD \
						 --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 \
						 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
export FZF_COMPLETION_TRIGGER=','

# ripgrep
# search hidden files ignoring .git/
alias rg="rg --hidden --glob '!.git' --glob '!.venv' --glob '!node_modules'"

# fzf ==> cd
alias cdf='cd $(find \( -name ".venv" -o -name ".git" -o -name "node_modules" \) -prune -o -type d -print | fzf)'

# fzf and ripgrep ==> nvim
edit_fzf()
{
    # if in tmux
    if [ "$TMUX" != "" ] && [ "$1" != "" ]
    then
        if [ "$1" = "sv" ]
        then
            fzf -e | xargs -r echo $EDITOR | xargs -r tmux split-window -vd
        elif [ "$1" = "s" ]
        then
            fzf -e | xargs -r echo $EDITOR | xargs -r tmux split-window -hd
        elif [ "$1" = "n" ]
        then
            fzf -e | xargs -r echo $EDITOR | xargs -r tmux new-window -d
        else
            fzf -e | xargs -r $EDITOR
        fi
    else
        fzf -e | xargs -r $EDITOR
    fi
}
alias eff=edit_fzf

edit_rg()
{
    # if in tmux
    if [ "$TMUX" != "" ] && [ "$1" != "" ]
    then
        if [ "$1" = "sv" ]
        then
            rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r echo $EDITOR | xargs -r tmux split-window -vd
        elif [ "$1" = "s" ]
        then
            rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r echo $EDITOR | xargs -r tmux split-window -hd
        elif [ "$1" = "n" ]
        then
            rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r echo $EDITOR | xargs -r tmux new-window -d
        else
            rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r $EDITOR
        fi
    else
        rg . | fzf --print0 -e | sed "s/:.*//" | xargs -r $EDITOR
    fi
}
alias erg=edit_rg

add_license()
{
	LICENSE=`svn ls https://github.com/spdx/license-list-data/trunk/text/ | fzf`
	svn export --force https://github.com/spdx/license-list-data/trunk/text/${LICENSE} ./LICENSE
	echo "pls make sure to add personal details in the LICENSE"
}
alias spdx=add_license

alias srcbrc="source ~/.bashrc"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
