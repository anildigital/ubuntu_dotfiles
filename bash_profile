if [[ -s /home/anil/.rvm/scripts/rvm ]] ; then source /home/anil/.rvm/scripts/rvm ; fi

# j.sh
source ~/code/ubuntu_dotfiles/j.sh
source ~/code/ubuntu_dotfiles/.resty

alias gemi='gem install --no-rdoc --no-ri'

PATH=$PATH:$HOME/.gem/ruby/1.8/bin:$PATH
PATH=$PATH:$HOME/bin:$PATH
PATH=$PATH:$HOME/code/appengine-java-sdk-1.3.1/bin:$PATH
PATH=$PATH:$HOME/home/anil/code/google_appengine:$PATH
 
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
export ENABLE_RACK_BUG='Y'
export NEW_SIGNUP_FLOW='Y'
export RAILS_PLATFORM='Y'
export LD_LIBRARY_PATH="/usr/local/lib"
 
 
 
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
 

export PATH="$HOME/code/google_appengine:$PATH"
export PYTHONPATH="$HOME/code/google_appengine:$PYTHONPATH"

