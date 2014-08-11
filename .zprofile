stty -ixon

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

platform='unknown'

if [[ $OSTYPE == 'linus-gnu' ]]; then
  platform='linux'
elif [[ $OSTYPE == 'darwin'* ]]; then
  platform='mac'
fi

# for homebrew
if [[ $platform == 'mac' ]]; then
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# for Java
if [[ $platform == 'mac' ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# for autoscaling
if [[ $platform == 'mac' ]]; then
  export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
  export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.12/libexec"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# for pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
