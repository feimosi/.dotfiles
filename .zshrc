plugins=(common-aliases fasd git git-extras npm docker archlinux frontend-search zsh-syntax-highlighting alias-tips virtualenv yarn)

# Previous theme: "robbyrussell"
export ZSH_THEME="powerlevel9k/powerlevel9k"
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export BROWSER=/opt/google/chrome-unstable/google-chrome-unstable

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah"
alias mux='tmuxinator'
alias muxs='tmuxinator s'

###############
# Git aliases #
###############

alias g='git'

alias ga='g a'
alias gaa='g aa'
alias gap='g ap'
alias gau='g au'

alias gb='g b'
alias gba='g ba'
alias gbd='g bd'
alias gbdf='g bdf'
alias gbv='g bv'

alias gc='g c'
alias gcb='g cb'

alias gcm='g cm'
alias gcmm='g cmm'
alias gcma='g cma'
alias gcmf='g cmf'
alias gcms='g cms'
alias gfix='g fix'

alias gcp='g cp'

alias gd='g d'
alias gdf='g df'
alias gds='g ds'
alias gdw='g dw'

alias gf='g f'
alias gfp='g fp'

alias gl='g l'
alias gla='g la'
alias gll='g ll'
alias gls='g ls'
alias glh='g lh'
alias glf='g lf'

alias gm='g m'
alias gmtw='g mtw'
alias gmff='g mff'

alias gp='g p'
alias gpf='g pf'
alias gpr='g pr'

alias gpu='g pu'
alias gup='g up'
alias gupas='g upas'

alias gr='g r'
alias gra='g ra'
alias grc='g rc'
alias grs='g rs'
alias gras='g ras'

alias grt='g rt'

alias gs='g s'

alias gsh='g sh'

alias gsp='g sp'
alias gsa='g sa'
alias gss='g ss'
alias gsl='g sl'

alias gt='g t'

alias gundo='g undo'
alias gabort='g abort'

alias branches='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --pretty=format:"%Cred %cn %>|(40) %Cblue %ar %>|(80) %Creset" $branch | head -n 1` $branch; done | sort -r'

alias q='gs'

#######################
# Development aliases #
#######################

alias fireup='git pull && npm update && npm start'
alias go='npm start'
alias build='npm run build'
alias n='npm'
alias nout='npm outdated'
alias ng='npm -g'
alias ngout='npm -g outdated'

alias dc='docker-compose'
alias dcrun='dc run'
alias dcup='dc up'

function t() {
 # Defaults to 3 levels deep, do more with `t 5` or `t 1`
 # pass additional args after
 tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 25 -L ${1:-3} -aC $2
}

# List commands in history (grouped by the first two 'words', e.g., "git
# commit" or "cd ~") and ordered from most-used to least-used.
function command-frequency() {
  cut -d ';' -f 2 < ~/.zsh_history 2> /dev/null | awk '{print $1 " " $2}' | sort | uniq -c | sort -rn
}

# List the most-frequently used commands
function top-commands() {
  command-frequency | head -n 30
}

# List the most-frequently used non-Git commands
function top-non-git() {
  command-frequency | grep -v ' g ' | grep -v ' git ' | head -n 30
}

# Run locally installed npm executables
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

source /usr/share/nvm/init-nvm.sh

############################
# Machine specific aliases #
############################
