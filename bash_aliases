alias free="free -m"
alias update="sudo aptitude update"
alias install="sudo aptitude install"
alias upgrade="sudo aptitude safe-upgrade"
alias remove="sudo aptitude remove"
alias felix="cd /home/anil/ms/svn/felix/trunk/server"
alias mong="felix && mongrel_rails start"
alias svnr="svn status -uv 2>/dev/null | egrep '^([^\? ]|       \*)'"
alias svnc="svn status | grep '^C'"
alias mysqlb="sudo mysql-query-browser &"
alias dev="ssh anilw@dev.purpletrail.com"
alias qa="ssh anilw@myyapper.mangospring.net"
alias qadom="ssh anilw@192.168.10.117"
alias firefoxd="firefox -P developer -NO-REMOTE &"
alias gvim="gvim . &"
alias sup="svn update"
alias rlc="felix && rake log:clear"
alias lessd="felix && less -n -R log/development.log"
alias less="less -R"
alias c="cheat"
alias aoff="sudo apache2ctl stop"
alias aon="sudo apache2ctl start"
alias ares="sudo apache2ctl restart"
