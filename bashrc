# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


#for enabling custom bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#for enabling custom bash aliases
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

PATH=$PATH:$HOME/bin:$PATH
PATH=$PATH:$HOME/rubymine435/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-6-sun
export JDK_HOME="/usr/lib/jvm/java-6-sun/"

#ec2 related settings
export EC2_HOME=$HOME/ec2-api-tools
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=~/.ec2/pk-PMN35B5MXIUTGJ6IWACCPS2B5Q4NKBCC.pub
export EC2_CERT=~/.ec2/cert-PMN35B5MXIUTGJ6IWACCPS2B5Q4NKBCC.pub
export PATH

export AWS_ACCESS_KEY_ID=0QZ75MC87Z8804PSSMR2
export AWS_SECRET_ACCESS_KEY=raJBR0iylNexzxYNEOxkmJSmmJ2xaI1iS1+UxGbs
export RUBYLIB=/opt/s3sync
export SSL_CERT_DIR=/opt/s3sync
export RUBYOPT=rubygems
alias cockpit='JETS3T_HOME=/opt/jets3t sh /opt/jets3t/bin/cockpit.sh'
alias s3cmd='. /opt/s3sync/s3_variables ; /opt/s3sync/s3cmd.rb'
alias s3sync='. /opt/s3sync/s3_variables ; /opt/s3sync/s3sync.rb'

# Open emacs default in network mode
alias emacs='emacs -nw'


#for enabling custom bash aliases
if [ -f ~/.felixrc ]; then
	    . ~/.felixrc
fi

# http://gist.github.com/23914
function pless {
  pygmentize $1 | less -r
}

