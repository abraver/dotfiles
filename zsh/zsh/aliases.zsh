alias reload!='. ~/.zshrc'
alias top='top -o cpu'
alias docker-clean="docker images --no-trunc | grep none | awk '{print $3}' | xargs docker rmi"


alias 'ssh_penguinpi'='ssh -R 52698:localhost:52698 pi@penguinpi.dynu.net'

alias 'ssh_abc'='ssh -R 52698:localhost:52698 abraver@abc'
alias 'rsync_abc'='rsync -azPL /Users/abraver/Sites/abc/ abraver@abc:~/abc'

