# to be placed at ~/.bash_aliases

# add color to common commands
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias la="ls -A"
alias ll="ls -alF"

# ssh aliases
alias sshcori="ssh -Y jlilly@cori.nersc.gov"
alias sshgr="ssh -Y -t jlilly@wtrw.lanl.gov ssh gr-fe"

# Variables useful for scp
export CORI="jlilly@cori.nersc.gov"

