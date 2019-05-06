# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/ego/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="edvardm"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  sudo
  archlinux
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

function hdmi() {
    
    xrandr | grep "HDMI1 disconnected" >/dev/null

    if [ $? -eq 0 ]
    then
        echo "HDMI is not connected!"
    else
        xrandr --output HDMI1 --mode 1920x1080
        sleep 1
        xrandr --output eDP1 --off
    fi

}

function whdmi() {
    
    xrandr | grep "HDMI1 disconnected" >/dev/null

    if [ $? -eq 0 ]
    then
        echo "HDMI is not connected!"
    else
        xrandr --output HDMI1 --mode 2560x1080
        sleep 1
        xrandr --output eDP1 --off
    fi

}

function edp() {
    
    xrandr --output HDMI1 --off
    sleep 1
    xrandr --output eDP1 --mode 1366x768

}

function vp() {
    
    cd /home/ego/work/eoimagine
    nvim .
}

function win7() {
    
    startx /home/ego/vms/runwin7.sh :4
}

function conj() {
    w3m "conjuga-me.net/verbo-$1"
}

function sconj() {
    w3m "http://www.spanishdict.com/conjugate/$1"
}

bindkey -s ',.' 'ranger\n'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export EDITOR='nvim'
export VISUAL='nvim'
export GTK_THEME='Qodir-dark'
export PATH=$JAVA_HOME/bin:$PATH

alias v='nvim'

alias vcv='nvim /home/ego/.config/nvim/init.vim'
alias vci='nvim /home/ego/.config/i3/config'
alias vcz='nvim /home/ego/.zshrc'
alias vcp='nvim /home/ego/.config/polybar/config'
alias vcx='nvim /home/ego/.Xresources'

alias md='sudo mount /dev/sdb1 /mnt -o umask=000'
alias umd='sudo umount -l /mnt'
alias c='cd ..'
alias sl='ls'
alias l='ls'
alias z='zathura'
alias r='ranger'
alias i='sudo pacman -Sy'
alias R='R --quiet'
alias clip='xclip -se c'
alias elenx='sudo curlftpfs elenx.net /media/elenx -o user=public:public,allow_other'
alias egowifi='sudo netctl start egowifi'
alias poff='sudo systemctl poweroff'
alias rboot='sudo systemctl reboot'
alias qt='XDG_CURRENT_DESKTOP=kde'
alias w32='WINEPREFIX=~/.wine32 wine'

alias gi='cd /home/ego/work/eoimagine'
alias gir='cd /home/ego/work/eoimagine/run'
alias gw='cd /home/ego/work'
alias gcv='cd /home/ego/.config/nvim'

# Git aliases

alias gs='git status'
alias ga='git add'
alias gc='git checkout'
alias gb='git branch'
alias gcm='git commit -m'
alias gpm='git push origin master'

alias isnet="ping -c1 8.8.8.8 | awk '/transmitted/ {print \$1}'"
alias swaylap="sway -c /home/ego/.config/sway/configlap"
alias swayhd="sway -c /home/ego/.config/sway/confighd"
alias candr="adb shell screenrecord --output-format h264 - | ffplay -"

alias rsnet='sudo ip link set wlp6s0 down && sleep 1 && sudo ip link set wlp6s0 up'
alias lgrep='ls -1 --color=always | grep'

export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

mwl() {

    mv $1 $HOME/pics/wall
}
