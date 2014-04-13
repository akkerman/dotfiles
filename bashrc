alias l='ls -la' 


export PATH=/home/akkerman/bin:$PATH


export JAVA_HOME=/opt/java
export PLAY_HOME=/opt/play
export SCALA_HOME=/opt/scala
export PATH=~/bin:$JAVA_HOME/bin:$PLAY_HOME:$SCALA_HOME/bin:/opt/sbt/bin:$PATH

# TODO.SH {
alias t='todo.sh'
source /home/akkerman/bin/todo_completion
complete -F _todo t
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
# }
