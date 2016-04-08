# Load official plugin
source $ZSH/plugins/git/git.plugin.zsh

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

alias gaac='git add --all && git commit -v'
alias gap='git add -p'
unalias gb 2>/dev/null
alias gb='git branch -a -v'
alias gbd='git branch -D'
alias gcane='git commit --amend --no-edit'
alias gcop='git checkout -p'
alias gds='git diff --staged'
alias gh='git log --graph --pretty=format:"%Cred%h%Creset -%C(green)%C(bold)%d%Creset %s %C(yellow)(%cr)%Creset by %an" --abbrev-commit'
alias gha='gh --all'
alias gi='git init'
alias gmv='git mv'
alias grbim='git rebase -i master'
unalias gr 2>/dev/null
alias gr='git remote -v'
unalias grh 2>/dev/null
alias grh='git reset --hard' # I use this *far* more than `git reset HEAD`
alias grm='git rm'
alias gs='git stash'        # I prefer this to `gsta`
alias gsp='git stash pop'   # and `gstp`
alias gshow='git show'
alias gw='git add --all . && git reset --hard HEAD'

# Multigit + Git across multiple repos
alias mgup='for d in */ ; do cd $d; git pull --rebase --recurse-submodules; popd; done'
