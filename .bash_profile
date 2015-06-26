# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
export PATH

source $HOME/git/contrib/completion/git-completion.bash
source $HOME/git/contrib/completion/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

# export PS1="\n\[$(tput bold)\]\[\033[38;5;199m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;243m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export PS1='\n\[$(tput bold)\]\[\033[38;5;199m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]$(__git_ps1 " (%s)")\$ '
# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias ..='cd ..'
alias ...='cd ../..'
alias ga='git add'
alias gds='git diff --staged'
alias gup='git pull --rebase'
alias gd='git diff'
alias gco='git checkout'
alias gcm='git checkout master'
alias grbm='git rebase master'
alias gh='git log --graph --pretty=format:"%Cred%h%Creset -%C(green)%C(bold)%d%Creset %s %C(yellow)(%cr)%Creset by %an" --abbrev-commit'
alias gha='gh --all'
alias gaa='git add --all'
alias gaac='git add --all && git commit -v'
alias gb='git branch -a -v'
alias gbd='git branch -D'
alias gcane='git commit --amend --no-edit'
alias gcb='git checkout -b'
alias gclone='git clone'
alias gcop='git checkout -p'
alias gmv='git mv'
alias grbim='git rebase -i master'
alias gr='git remote -v'
alias grh='git reset --hard' # I use this *far* more than `git reset HEAD`
alias grm='git rm'
alias gs='git stash'        # I prefer this to `gsta`
alias gsp='git stash pop'   # and `gstp`
alias gshow='git show'
alias gw='git add --all . && git reset --hard HEAD'


function cd() {
  builtin cd "$@" && ls;
}

function g() {
  if [[ $# > 0 ]]; then
    git "$@"
  else
    git status
  fi
}

