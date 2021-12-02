# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"
#ZSH_THEME="dracula"

# SPACESHIP_RUBY_SYMBOL="💎 "
# SPACESHIP_GOLANG_SYMBOL="🐹 "
# SPACESHIP_PHP_SYMBOL="🐘 "
# SPACESHIP_DOCKER_SYMBOL="🐳 "
# SPACESHIP_PYENV_SYMBOL="🐍 "

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting grc colorize command-not-found)
source $ZSH/oh-my-zsh.sh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugin colorize
ZSH_COLORIZE_TOOL=chroma
ZSH_COLORIZE_STYLE="solarized-dark256"
ZSH_COLORIZE_CHROMA_FORMATTER=terminal16m

# apt install zsh-autosuggestions 
source $(dpkg -L zsh-autosuggestions | grep 'zsh$')

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export VISUAL='nvim'
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# highlighting command output
#[[ -f /usr/bin/grc ]] && {
 #alias ping="grc --colour=auto ping"
 #alias traceroute="grc --colour=auto traceroute"
 #alias make="grc --colour=auto make"
 #alias diff="grc --colour=auto diff"
 #alias cvs="grc --colour=auto cvs"
 #alias netstat="grc --colour=auto netstat"
#}

#alias cat="grc cat"
#alias tail="grc tail"
#alias head="grc head"

alias cat="ccat"
alias less="cless"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# rename-move with confirmation without correction
alias mv='mv -i'
# recursive copy with confirmation without correction
alias cp='cp -iR'
# deletion with confirmation without correction
alias rm='rm -i'
# forced deletion without correction
alias rmf='rm -f'
# forced recursive deletion without correction
alias rmrf='rm -fR'

# apt
alias api="sudo apt install"
alias upd="sudo apt update"
alias upg="sudo apt full-upgrade"
alias dupg="sudo apt dist-upgrade"
alias purge="sudo apt purge --auto-remove"
alias acs="apt search"
alias auu="sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt purge --auto-remove"

# other
alias mc="mc -S gotar"
#alias rg="ranger"
alias rg='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`busybox cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias unp="udisksctl unmount -b $1 && udisksctl power-off -b $1"
# MS VScode
#alias code="bash -c code"
alias code="code --disable-gpu"

#exec --no-startup-id i3-msg "1; exec /usr/bin/firefox"

# autorun byobu and connect to old session
:<< comments
connecting to a previously created session
a new window is created in a new session
closing the window closes the terminal
avoid nesting instances
comments
#if [[ $EUID -ne 0 ]]; then
#	BYOBU_SESSION=/dev/shm/byobu_session
#        if [[ -z "$BYOBU_RUN_DIR" ]]; then
#                exec $(byobu -S $BYOBU_SESSION)
#        elif [[ -z "$TMUX"  ]]; then
#        	exec $(byobu -S $BYOBU_SESSION)
#        fi
#fi


# do not output an error if the template matches  (ls *)
setopt +o nomatch

# сommand line prompt in Midnight Commander
if ps $PPID |grep mc; then
	if [[ $EUID == 0 ]]; then
		PROMPT=$'%n ➜ '
	else
		PROMPT=$'➜ '
	fi
fi

# autorun tmux, for UID != 0 (without VScode env error)
if [[ $EUID -ne 0 ]] && [[ "$TMUX" == "" ]] \
    && ! pstree -s $$ | grep -Ewq "code|n?vim"; then
    exec tmux; 
fi

