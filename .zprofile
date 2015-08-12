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
  # for Java
  export JAVA_HOME=$(/usr/libexec/java_home)
  export ANDROID_HOME="/usr/local/opt/android-sdk"
  # for autoscaling
  export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
  export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.12/libexec"
  # for go stuff
  GO_VERSION="1.3.3"
  export GOROOT="/usr/local/Cellar/go/$GO_VERSION/libexec"
  export GOPATH="$HOME/go"
  export PATH="$PATH:/usr/local/opt/go/libexec/bin"
  # ec2 api
  EC2_API_VERSION="1.7.1.0"
  export EC2_HOME="/usr/local/Cellar/ec2-api-tools/$EC2_API_VERSION/libexec"
  # cloudformation api
  CFN_API_VERSION="1.0.12"
  export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/$CFN_API_VERSION/libexec"
  # autoscaling api
  AS_API_VERSION="1.0.61.6"
  export AWS_AUTO_SCALING_HOME="/usr/local/Cellar/auto-scaling/$AS_API_VERSION/libexec"
  # for mactex
  eval `/usr/libexec/path_helper -s`

  # for boot2docker
  export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
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

  # For pyenv
  export PYENV_PATH="$HOME/.pyenv/bin"
  if [ -d $PYENV_PATH ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
  fi
fi

# for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# for pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load RVM into a shell session *as a function*
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
