# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ipap/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

SPACESHIP_USER_SHOW="always"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	z
	osx
	pod
	themes
	zsh-autosuggestions
	zsh-completions
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if [[ -d "$HOME/.fastlane/bin" ]]; then 
	export PATH="$HOME/.fastlane/bin:$PATH"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#
alias zshconfig="gvim ~/Code/Git/customThings/.zshrc"
alias ohmyzsh="gvim ~/.oh-my-zsh"
alias gogit="cd ~/Code/Git"
alias ..="cd .."
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias grep="grep --color --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias reload='source ~/.zshrc'
alias config='gvim ~/.zshrc'
alias token='~/Code/stagingToken.sh'
alias rbc='git add .; git rebase --continue'
alias mergetool='git mergetool'

function acp() {
  git add .
  git commit -m "$1"
  git push
}

function fxp() {
  git add .
  git commit --fixup HEAD
  git rebase -i --autosquash HEAD~2
  git push -f
}


function pullRequest() {
	echo "i am in"
	echo $1
	if [ $1 != ""  ]; then 
		echo "git checkout -b $1 --track/origin/$1"
	fi
}

function check_pr() {
  if [ -z "$1" ]
  then
    echo "vale branch name re kerata"
    return 1
  fi
  
  echo 'Your input: ' $1
  git remote update --prune
  git branch -d $1
  git checkout -b $1 --track origin/$1
  git reset develop
}



# NPM global installs
export PATH=$PATH:~/.npm-global/bin§
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="/usr/local/opt/ruby/bin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add -K
fi
export PATH=/usr/local/bin:$HOME/bin:$PATH
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
