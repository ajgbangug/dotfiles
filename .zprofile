# this is so that i can use ctrl
stty -ixon

if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  source /etc/profile
fi

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# identify if what i'm running in
platform='unknown'
if [[ $OSTYPE == 'linus-gnu' ]]; then
  platform='linux'
elif [[ $OSTYPE == 'darwin'* ]]; then
  platform='mac'
fi

##############################
# PATH stuff
##############################

# for homebrew
if [[ $platform == 'mac' ]]; then
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# for Java
if [[ $platform == 'mac' ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export ANDROID_HOME=/usr/local/opt/android-sdk
fi

# for autoscaling
if [[ $platform == 'mac' ]]; then
  export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
  export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.12/libexec"
fi

# for go stuff
export GOROOT=/usr/local/Cellar/go/1.3.2/libexec
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# for pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# for pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
