# this is so that i can use ctrl
stty -ixon

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# identify if what i'm running in
platform="unknown"
if [[ $OSTYPE == "linus-gnu" ]]; then
  platform="linux"
elif [[ $OSTYPE == "darwin"* ]]; then
  platform="mac"
fi

##############################
# PATH stuff
##############################
# OSX specific configs
if [[ $platform == "mac" ]]; then
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
fi

# for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# for pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
