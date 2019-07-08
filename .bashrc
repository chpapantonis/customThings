# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac
#
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
#
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033\[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033\[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
#
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lFG'
alias la='ls -alFG'
alias l='ls -CFG'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#Custom Shortcuts
alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
#
# Default to human readable figures
 alias df='df -h'
 alias du='du -h'
#
# Misc :)
 alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
 alias grep='grep -rn --color'                     # show differences in colour
 alias egrep='egrep --color=auto'              # show differences in colour
 alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
 #alias ls='ls -hF --color=tty'                 # classify files in colour
 alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
  
#Custom aliases                              #'
alias gogit='cd ~/Code/Git'
alias ~='cd ~/'


#Syntactic sugar for ANSI escape sequences
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtyel='\e[0;93m' #yellow
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Prompt variables
#PROMPT_BEFORE="$txtwht[$txtcyn\u:$txtwht\w]$txtrst"
#PROMPT_AFTER="\\\\$ "
#
## Prompt command
#PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER"'
#
## Git prompt features (read ~/.git-prompt.sh for reference)
#export GIT_PS1_SHOWDIRTYSTATE="true"
#export GIT_PS1_SHOWSTASHSTATE="true"
#export GIT_PS1_SHOWUNTRACKEDFILES="true"
#export GIT_PS1_SHOWUPSTREAM="auto"
#export GIT_PS1_SHOWCOLORHINTS="true"
# Change this to the location of git-prompt.sh on your distribution.
source /usr/local/etc/bash_completion
 
# Creates the bash_prompt function
bash_prompt () {
 
# Checks to see if the current directory is a git repo or not
gitcheck_branch="$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "yes"; else echo "no"; fi)"
 
if [ $gitcheck_branch == "yes" ];
then
        # If we are in a git repo, then check to see if there are uncommitted files
        gitcheck_status="$(git status | grep "nothing to commit" > /dev/null 2>&1; if [ $? -eq 0 ]; then echo "clean"; else echo "unclean"; fi)"
 
    if [ $gitcheck_status == "clean" ];
    then
                # If there are no uncommitted files, then set the color of the git branch name to green
        git_prompt='\[\033[0;32m\]$(__git_ps1)'
    else
                # If there are uncommitted files, set it to red.
        git_prompt='\[\033[0;31m\]$(__git_ps1)'
    fi
else
        # If we're not in a git repo, then display nothing
    git_prompt=""
fi
 
# This is what actually sets our PS1. The ${git prompt} is what will display our git status.
PS1="\e[0;36m\]\[\e[1;36m\]\u\]\]:\[\e[0;93m\]\w${git_prompt}\n👉\[\033[00m\] "
#PS1="$txtyel[$txtcyn\u$txtyel@$txtcyn\h$txtyel]:$txtpur(\w)${git_prompt}\n$txtgrn#> $txtrst"
 
}
# PROMPT_COMMAND is run just before the PS1 is printed. We've set it to run our bash_prompt function.
PROMPT_COMMAND=bash_prompt

# alias cd=cd_func
function gi() { 
   curl -L -s https://www.gitignore.io/api/$@ ;
}

   
export DISPLAY=localhost:0
export LANG="en_GB.UTF-8"
#export LM_LICENSE_FILE="/opt/synopsys/.synopsys/synopsys.dat"
#PATH=$PATH:/opt/synopsys/H-2013.03-SP5/bin/
#PATH=$PATH:/opt/synopsys/flow/
#export PATH
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
export PATH="/Users/chpapantonis/Documents/sonar-scanner/bin/:$PATH"
export PATH="/Users/chpapantonis/Documents/sonarqube/macosx/:$PATH"
export PATH="/Users/chpapantonis/Documents/clang/bin/:$PATH"

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

