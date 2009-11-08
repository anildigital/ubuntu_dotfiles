# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# j.sh
source ~/code/ubuntu_dotfiles/j.sh
source ~/code/ubuntu_dotfiles/.resty

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

export JAVA_HOME=/usr/lib/jvm/java-6-sun
export JDK_HOME="/usr/lib/jvm/java-6-sun/"

# s3
export AWS_ACCESS_KEY_ID=0QZ75MC87Z8804PSSMR2
export AWS_SECRET_ACCESS_KEY=raJBR0iylNexzxYNEOxkmJSmmJ2xaI1iS1+UxGbs

export RUBYOPT=rubygems

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


complete -C ~/bin/rake-complete.rb -o default rake


# Bash snippet to open new shells in most recently visited dir.
# Useful if you want to open a new terminal tab at the present 
# tab's location.
#
# Put this in your .bashrc or whatever.

pathed_cd () {
    if [ "$1" == "" ]; then
        cd
    else
        cd "$1"
    fi
    pwd > ~/.cdpath
}
alias cd="pathed_cd"

if [ -f ~/.cdpath ]; then
  cd $(cat ~/.cdpath)
fi



export EDITOR='vim'

function complete_cheat {
  COMPREPLY=()
  if [ $COMP_CWORD = 1 ]; then
    sheets=`cheat sheets | grep '^  '`
    COMPREPLY=(`compgen -W "$sheets" -- $2`)
  fi
}
complete -F complete_cheat cheat


# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
# username@Machine ~/dev/dir[master]$ # clean working directory
# username@Machine ~/dev/dir[master*]$ # dirty working directory
 
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \w $(parse_git_branch)$ '



# PT specific configuration
export LOCAL_SSL_ENABLED='true'
export USE_MEMCACHE='Y'
export NEW_SIGNUP_FLOW='Y'
export RAILS_PLATFORM='Y'
export LD_LIBRARY_PATH=/usr/local/lib



# -- start rip config -- #
RIPDIR=/home/anil/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #


# put this in ~/.bash_profile or whatever
ruby_or_irb () {
  if [ "$1" == "" ]; then
    irb
  else
    ruby "$@"
  fi
}
alias ruby="ruby_or_irb"




 
# http://ozmm.org/posts/local_gems.html
alias gemi='gem install --no-rdoc --no-ri -y'
export GEM_HOME="$HOME/.gems"
export GEM_PATH="$GEM_HOME"
export PATH="$HOME/.gems/bin:$PATH"
