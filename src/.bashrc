# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=8000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#export LESSOPEN="| /usr/bin/lesspipe %s";
#export LESSCLOSE="/usr/bin/lesspipe %s %s";

hg_ps1() {
    hg prompt " ({{branch}}{ {status}})" 2> /dev/null
}
export GIT_PS1_SHOWDIRTYSTATE=1
source /home/reinhardt/.local/bin/git-prompt.sh

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
   rxvt-unicode-256color | xterm-termite | xterm-256color | xterm-color | xterm | screen-256color-bce | screen-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ -f ~/.pathcolor ]]; then
        path_color=$(cat ~/.pathcolor);
    else
        path_color='[01;35m'
    fi
    if [[ -f ~/.namecolor ]]; then
        name_color=$(cat ~/.namecolor);
    else
        name_color='[01;32m'
    fi
    PS1='${debian_chroot:+($debian_chroot)}\[\033${name_color}\]\u@\h\[\033[00m\]:\[\033${path_color}\]\w\[\033[00m\]$(__git_ps1 " (%s)")$(hg_ps1)\n\[\033[1;36m\][\t]\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)")\n\[\t]\$ '
fi
unset color_prompt force_color_prompt

#source /run/current-system/sw/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.config/dircolors`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'

alias gr="grep -RI --exclude-dir=.svn --exclude-dir=.git"
alias open="xdg-open"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
command -v jira >/dev/null && eval "$(jira --completion-script-bash)"

#VMware config
export VI_SERVER=192.168.201.230
export VI_USER=root
export VI_PASSWORD=

export PYTHONSTARTUP="/home/reinhardt/.pythonrc"
export LESS="R"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="xterm"

[ -a /etc/profile.d/nix.sh ] && source /etc/profile.d/nix.sh
#export NIX_PATH=~/.nix-defexpr/channels
#export NIX_PATH=$NIX_PATH:/nix/var/nix/profiles/per-user/root/channels/nixos

if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    gpg-connect-agent /bye
fi
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  unset SSH_AGENT_PID
fi
#if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
#fi
GPG_TTY=$(tty)
export GPG_TTY

export PASSWORD_STORE_GENERATED_LENGTH=32

if [[ -f ~/.initialdir ]]; then cd $(cat ~/.initialdir); fi
