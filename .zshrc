plugins=(common-aliases fasd git git-extras npm docker archlinux frontend-search zsh-syntax-highlighting)

export ZSH_THEME="robbyrussell"
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

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
alias gm='g m'
alias gmtw='g mtw'
alias gmff='g mff'
alias gp='g p'
alias gpf='g pf'
alias gpr='g pr'
alias gpu='g pu'
alias gr='g r'
alias gra='g ra'
alias grc='g rc'
alias grs='g rs'
alias gs='g s'
alias gsh='g sh'
alias gsp='g sp'
alias gsa='g sa'
alias gss='g ss'
alias gsl='g sl'
alias gup='g up'
alias gundo='g undo'
alias gabort='g abort'
alias branches='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --pretty=format:"%Cred %cn %>|(40) %Cblue %ar %>|(80) %Creset" $branch | head -n 1` $branch; done | sort -r'

alias fireup='git pull && npm update && npm start'
alias go='npm start'
alias build='npm run build'
alias n='npm'
alias nout='npm outdated'
alias ng='npm -g'
alias ngout='npm -g outdated'

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

############################
# Machine specific aliases #
############################
