ZSH_THEME="robbyrussell"

plugins=(git)

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
alias gds='g ds'
alias gdw='g dw'
alias gf='g f'
alias gl='g l'
alias gla='g la'
alias gll='g ll'
alias gp='g p'
alias gr='g r'
alias gra='g ra'
alias grc='g rc'
alias grs='g rs'
alias gs='g s'
alias gup='g up'

alias fireup='git pull && npm update && npm start'
alias go='npm start'
alias build='npm run build'
alias n='npm'
alias nout='npm outdated'
alias ng='npm -g'
alias ngout='npm -g outdated'
