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

# Linux
# export ZSH=/usr/share/oh-my-zsh/ # On Ubuntu /home/marek/.oh-my-zsh/
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:~/.local/bin:/home/marek/.local/bin"
# export BROWSER=/opt/google/chrome-unstable/google-chrome-unstable

# Mac
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias z="j" # autojump
alias cat="bat"
alias ls="eza" # Previously exa
alias l="ls -lah"
alias man='tldr'
alias mux='tmuxinator'
alias muxs='tmuxinator s'
alias qq='yt-dlp'

alias remove_unused_dependencies='pacman -Rs $(pacman -Qdtq)'
alias pgadmin='cd ~/pgAdmin && docker-compose up -d && sleep 3 && chromium http://localhost:9201/browser/ &'
alias docker_cleanup='docker system prune -a --volumes'
alias find_file='fzf'
# Search files with ripgrep
function rr(){ rg -p "$1" | less -RF }
alias system_info='inxi --full --admin --verbosity=7 --filter --no-host'
alias running_services='systemctl list-units  --type=service  --state=running'

# Async auto suggestions
# https://github.com/romkatv/powerlevel10k/issues/1554#issuecomment-1701598955
unset ZSH_AUTOSUGGEST_USE_ASYNC

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
alias gci='g checkout $(git branch | fzf | xargs) '

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

# Use 'true' at the end to prevent PIPE 141 exit code
# Because of that it needs to be a function
# https://www.ingeniousmalarkey.com/2016/07/git-log-exit-code-141.html
unalias gl
function gl(){ g l "$@" || true }
compdef _git gl=git-log
function gla(){ g la "$@" || true }
compdef _git gla=git-log
function gll(){ g ll "$@" || true }
compdef _git gll=git-log
function gls(){ g ls "$@" || true }
compdef _git gls=git-log
unalias glg # Defined in oh-my-zsh gitplugin
function glg(){ g lg "$@" || true }
compdef _git glg=git-log
function glh(){ g lh "$@" || true }
compdef _git glh=git-log
function glf(){ g lf "$@" || true }
compdef _git glf=git-log

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

# Linux
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Mac
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

############################
# Machine specific aliases #
############################
