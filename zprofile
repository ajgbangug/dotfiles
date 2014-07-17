stty -ixon
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"
export TERM=xterm-256color

# for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# for Java
export JAVA_HOME=$(/usr/libexec/java_home)

# for virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# for autoscaling
export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.12/libexec"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
