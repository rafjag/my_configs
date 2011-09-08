# .bashrc

# User specific aliases and functions

# Source global definitions
#export LANG=pl_PL.UTF-8
export LC_ALL=pl_PL.UTF-8
#export LC_ALL=pl_PL

#maven support
export M2_HOME=/usr/local/share/apache-maven/apache-maven-3.0.2
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

export PATH=$M2:$PATH
alias Eterm="export LC_ALL=pl_PL; /usr/bin/Eterm"
alias mc="export LC_ALL=pl_PL; /usr/bin/mc"

PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

