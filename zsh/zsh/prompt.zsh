autoload colors && colors

hostname_prompt() {
  # HOSTNAME=`hostname | sed "s/\.local$//"`
  HOSTNAME=`hostname`
  if [[ $HOSTNAME =~ "^magellan" ]]
  then
    echo "🐧"
    # echo "◉"
  # elif [ "${HOSTNAME}" = "rogue" ]
  # then
  #   echo "🚀"
  # elif [ "${HOSTNAME}" = "cerebra" ]
  # then
  #   echo "🐶"
  # elif [ "${HOSTNAME}" = "polaris" ]
  # then
  #   echo "🤘"
  else
    echo "${HOSTNAME}"
  fi
}

rb_prompt() {
  if $(which rbenv &> /dev/null) && $(rbenv version | awk '{print $1}' | grep -qv system)
  then
    echo "[%{$fg_bold[red]%}$(rbenv version | awk '{print $1}')%{$reset_color%}] "
  else
    echo ""
  fi
}

virtualenv_prompt() {
  if [ -n "${VIRTUAL_ENV}" ]
  then
    echo "[%{$fg_bold[blue]%}$(basename `dirname "${VIRTUAL_ENV}"`)%{$reset_color%}] "
  else
    echo ""
  fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PROMPT=%K{white}%F{black}[$'$(virtualenv_prompt)$(rb_prompt)$(hostname_prompt) %(4~|…/%2~|%~)]$%f%k '

precmd() {
  title "zsh" "%m" "%55<...<%~"
}
