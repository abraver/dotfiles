alias reload!='. ~/.zshrc'
alias top='top -o cpu'
alias docker-clean="docker images --no-trunc | grep none | awk '{print $3}' | xargs docker rmi"
