# this is so that i can use ctrl
stty -ixon

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# identify if what i'm running in
export platform="unknown"
if [[ $OSTYPE == "linux-gnu" ]]; then
  export platform="linux"
elif [[ $OSTYPE == "darwin"* ]]; then
  export platform="mac"
fi

##############################
# PATH stuff
##############################
if [[ $platform == "mac" ]]; then
  # OSX specific configs

  # fix for path_helper messing up PATH when in tmux
  if [ -x /usr/libexec/path_helper ]; then
    PATH=""
    source /etc/profile
  fi

  # for homebrew
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/python/libexec/bin:$PATH"

  # for Java
  export JAVA_HOME=$(/usr/libexec/java_home)
  export ANDROID_HOME=$HOME/Library/Android/sdk

  # for mactex
  eval `/usr/libexec/path_helper -s`
elif [[ $platform == "linux" ]]; then
  # Linux specific configs

  # Start SSH-agent automatically
  SSH_ENV="$HOME/.ssh/environment"

  function start_agent {
      echo "Initialising new SSH agent..."
      /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
      echo succeeded
      chmod 600 "${SSH_ENV}"
      . "${SSH_ENV}" > /dev/null
      /usr/bin/ssh-add;
  }

  # Source SSH settings, if applicable
  if [ -f "${SSH_ENV}" ]; then
      . "${SSH_ENV}" > /dev/null
      #ps ${SSH_AGENT_PID} doesn't work under cywgin
      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
          start_agent;
      }
  else
      start_agent;
  fi
fi

# docker-compose aliases and cleanup commands
alias dcomp=docker-compose
alias dcompup="docker-compose up -d"
alias dcompdown="docker-compose down"
alias dvprune="docker volume prune -f"
alias dcprune="docker container prune -f"
alias diprune="docker image prune -f"
alias dvciprune="dvprune && dcprune && diprune"
alias dlogs="docker logs -f"

# convenience alias for kubectl
alias kc=kubectl

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# for pyenv
export PYENV_ROOT=$HOME/.pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# for node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for go
export GOPATH=$HOME/Development/go
if which go > /dev/null; then export PATH=$PATH:$(go env GOPATH)/bin; fi

# extra kubeconfigs
if [ -d "$HOME/.kube/conf.d" ]; then
  export KUBECONFIG=$HOME/.kube/config$(for i in $(ls -d1 $HOME/.kube/conf.d/*); do echo ":$i"; done;)
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
