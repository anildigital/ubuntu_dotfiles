alias free="free -m"
alias update="sudo aptitude update"
alias install="sudo aptitude install"
alias upgrade="sudo aptitude safe-upgrade"
alias remove="sudo aptitude remove"
source ~/.work_aliases
alias svnr="svn status -uv 2>/dev/null | egrep '^([^\? ]|       \*)'"
alias svnc="svn status | grep '^C'"
alias diff="colordiff" 
alias mysqlb="sudo mysql-query-browser &"
alias mysqlstart="sudo /etc/init.d/mysql start"
alias firefoxd="firefox -P developer -NO-REMOTE &"
alias gvim="gvim . &"

alias rlc="juno && rake log:clear RAILS_ENV=production"
alias lessd="juno && less -i -n -R log/development.log"
alias lessp="juno && less -i -n -R log/production.log"
alias taild="juno && tail -f log/development.log"

alias less="less -R"
alias rm="rm -i"
alias c="cheat"
alias off="sudo apache2ctl stop"
alias on="sudo apache2ctl start"
alias mong="juno && rackup"
alias restart="sudo apache2ctl stop && sudo apache2ctl start"
alias ares="sudo apache2ctl restart"
alias this="juno && thin start"
alias ichr="ssh anil@icanhasruby.com"
alias die="sudo killall"
alias conns='sudo lsof -i'
alias rb='railsbench'
alias editaliases='cd ~ && vim ~/.bash_aliases'
alias remove_tmp="rm -rf \`find . -name *.tmp\`"
alias tun="rtunnel_client -c icanhasruby.com -f 4000 -t localhost:3000"
alias send_emails="rake utils:send_emails SKIP_SERVER_INIT=Y"
alias daily_task="rake utils:daily_task SKIP_SERVER_INIT=Y"
alias hourly_task="rake utils:hourly_task SKIP_SERVER_INIT=Y"
alias 'ps?'='ps ax | grep '
alias sq="curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2"
alias gitlog="git log --pretty=oneline --abbrev-commit"
alias rt="ssh -t anil@icanhasruby.com screen -r 19158.rtorrent"
alias irc="ssh -t anil@icanhasruby.com screen -r 4875.pts-4.anilwadghule"
alias vmfast="sudo sysctl vm.swappiness=0"
alias rsy="rsync -avP anil@icanhasruby.com:download ."
alias gen="ruby script/generate"
alias tweets="tweets.py  | less"
alias ack="ack-grep"
alias sqlyog="wine '/home/anil/.wine/dosdevices/c:/Program Files/SQLyog Community/SQLyog.exe'"
alias k="killall -9"
alias postbin="cd /home/anil/code/python/ && dev_appserver.py postbin/ --port 8085"
alias killchrome="sudo killall -9 chrome"
alias gemi='gem install --no-rdoc --no-ri GEM_HOME='
alias jgem="jruby -S gem"
alias bash_aliases="vi ~/.bash_aliases && source ~/.bash_aliases"
alias bashrc="vi ~/.bashrc && source ~/.bashrc"
alias bash_profile="vi ~/.bash_profile && source ~/.bash_profile"
alias man='gem man -s'
alias emacs='emacs -nw'
alias vi='emacs -nw'
alias vim='emacs -nw'
alias railscode="cd ~/code/rails/rails"