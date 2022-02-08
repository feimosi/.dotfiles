# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
  common-aliases 
  zsh-completions 
  fasd 
  dirhistory 
  git 
  git-extras 
  gitfast 
  git-auto-fetch 
  npm 
  node 
  docker 
  archlinux 
  frontend-search 
  colored-man-pages
  command-not-found
  alias-tips 
  virtualenv 
  yarn 
  sudo 
  tmuxinator 
  vscode 
  web-search
  zsh-autosuggestions 
  zsh-syntax-highlighting 
)

# Previous theme: "robbyrussell"
export ZSH_THEME="powerlevel10k/powerlevel10k"
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
export ZSH=/usr/share/oh-my-zsh/
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.local/bin:/home/marek/.local/bin"
export BROWSER=/opt/google/chrome-unstable/google-chrome-unstable
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40

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

alias cat="bat"
alias ls="exa"
alias l="ls -lah"
alias mux='tmuxinator'
alias muxs='tmuxinator s'

alias remove_unused_dependencies='pacman -Rs $(pacman -Qdtq)'
alias pgadmin='cd ~/pgAdmin && docker-compose up -d && sleep 3 && chromium http://localhost:9201/browser/ &'
alias docker_cleanup='docker system prune -a --volumes'

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
alias gcmmi='g cmmi'
alias gcma='g cma'
alias gcmf='g cmf'
alias gcmf='g cmfv'
alias gcms='g cms'
alias gfix='g fix'

alias gcp='g cp'

alias gd='g d'
alias gdf='g df'
alias gds='g ds'
alias gdsw='g dsw'
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
alias npmg='npm -g'
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

############################
# Machine specific aliases #
############################
