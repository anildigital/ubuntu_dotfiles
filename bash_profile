if [[ -s /home/anil/.rvm/scripts/rvm ]] ; then source /home/anil/.rvm/scripts/rvm ; fi

# j.sh
source ~/code/ubuntu_dotfiles/j.sh
source ~/code/ubuntu_dotfiles/.resty

## Set paths

#PATH=$PATH:$HOME/.gem/ruby/1.8/bin:$PATH
PATH=$PATH:$HOME/bin:$PATH

# app engine paths
PATH=$PATH:$HOME/code/appengine-java-sdk-1.3.1/bin:$PATH
export PATH="$HOME/code/google_appengine:$PATH"
export PYTHONPATH="$HOME/code/google_appengine:$PYTHONPATH"
 

# Environment variables

# java
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export JDK_HOME="/usr/lib/jvm/java-6-sun/"

# ruby
#export RUBYOPT=rubygems

# general
export EDITOR='emacs'
export LOCAL_SSL_ENABLED='true'
export LD_LIBRARY_PATH="/usr/local/lib" 


## Bash Functions

# http://gist.github.com/23914
function pless {
  pygmentize $1 | less -r
}
# browse cheat in style
function cheatl {
  cheat $1 | less -r
}
# does ls after cd.
function cd()
{
  builtin cd ${1:-$HOME} && ls
}

# fast ls
bind -x '"\C-o"':"ls -lh"
 
# rake complete
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