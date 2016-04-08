# List files when switching between directories
chpwd() ls

# The `f` command for quickly using Foreman,
# defaulting to `foreman start`
f () { foreman ${@:-start} }

# The `h` command for quickly using the Heroku CLI
h () { heroku ${@} }

# The `a` command shows aliases, filtered for a specified pattern
a () {
  if [[ $# > 0 ]]
  then
    alias | grep $@
  else
    view <(alias)
  fi
}

# The `m` command handles Meteor interaction
# By default, run meteor with loaded settings
# http://joshowens.me/environment-settings-and-security-with-meteor-js/
m () {
  if [[ $# > 0 ]]
  then
    meteor ${@}
  else
    meteor run --settings settings.json
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

make-ls() {
  make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'     | sort
}
