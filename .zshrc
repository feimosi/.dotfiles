ZSH_THEME="robbyrussell"

plugins=(git npm nyan vagrant archlinux frontend-search)

alias ..="cd .."
alias cd..="cd .."
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
alias gpu='g pu'
alias gr='g r'
alias gra='g ra'
alias grc='g rc'
alias grs='g rs'
alias gs='g s'
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
 tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}
