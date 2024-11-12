# to be placed at ~/.bash_aliases

# add color to common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias la='ls -A'
alias ll='ls -alF'

# easy cd between tabs
alias c='pwd > ~/.misc/pwd.txt'
alias d='cd $(cat ~/.misc/pwd.txt)'

# grep on bash history
alias hgrep='history | grep '

