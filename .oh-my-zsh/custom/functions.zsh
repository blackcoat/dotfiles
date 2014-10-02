# List files when switching between directories
chpwd() ls

# The `f` command for quickly using Foreman,
# defaulting to `foreman start`
f () { foreman ${@:-start} }

# The `g` command, as demonstrated in the Peepcode Play by Play with Ben Orenstein
# https://peepcode.com/products/play-by-play-benorenstein
#
# This command aliases `g` to `git`, but goes the extra step of running `git status`
# by default when no arguments are passed.
#
#
# Ben Orenstein's implementation can be found in the Play by Play at 0:22:09.
unalias g
g () { git ${@:-status} }

# The `a` command shows aliases, filtered for a specified pattern
a () {
  if [[ $# > 0 ]]
  then
    alias | grep $@
  else
    view <(alias)
  fi
}

# The `v` command starts Vagrant and SSH's into the guest OS, or runs
# an arbitrary command
v () {
  if [[ $# > 0 ]]
  then
    vagrant $@
  else
    time vagrant up && vagrant ssh
  fi
}

# Start current project in Tomcat
tc () {
  for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
      eval $COLOR='$fg_no_bold[${(L)COLOR}]'
      eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
  done
  TOMCAT_PATH=/usr/local/Cellar/tomcat/5.5.36
  echo "$(tput setf 3)*Unlinking previously launched apps*$(tput sgr0)"
  find $TOMCAT_PATH/webapps -type l -print0 | xargs -0 rm -vf

  echo "**Deleting stale session data**"
  rm -Rf $TOMCAT_PATH/work/Catalina/localhost

  echo "**Starting $(basename $PWD)**"
  ln -s $PWD $TOMCAT_PATH/webapps/.
  $TOMCAT_PATH/bin/catalina.sh run
}

# CLI for interacting with remote eXist databases
exist () {
  client='/Applications/eXist/bin/client.sh'
  if [[ $# > 0 ]]
  then
    $client -s -ouri=xmldb:exist://$1:8080/exist/xmlrpc -u admin -P surfsup1 -T /tmp/eXist-db.log -ocolors=true
  else
    echo "usage: $0 <server-name>"
    echo
    echo "Our most commonly used eXist-db servers are:"
    echo "   gsweblimintdevdb1   Internal Apps (development and staging)"
    echo "   gsweblimintprddb1   Internal Apps (production)"
    echo "   gsweblimpubprddb1   Public Apps (production)"
  fi
}

# Productivity
most-used() {
  if [[ $# > 0 ]]; then
    show=$1
  else
    show=10
  fi
  echo "** $show most used whole commands **"
  history | awk '{$1=""; print $0}' | sort | uniq -c | sort -rn | head -n $show
  echo
  echo "** $show most used executables **"
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -n $show
}

gup-all() {
  root_path=$PWD
  for i in $(find . -type d -maxdepth 1); {
    cd "$root_path/$i" > /dev/null 2>&1
    echo "Updating $i..."
    gf;
    gup;
    echo
    echo
  }
  cd $PWD
}

# For Migrations...
timestamp() {
  date "+%Y%m%d%H%M%S"
}

