# Git
alias gaa='git add --all'
alias gaac='git add --all && git commit -v'
alias gap='git add -p'
alias gbd='git branch -D'
alias gcane='git commit --amend --no-edit'
alias gcb='git checkout -b'
alias gclone='git clone'
alias gcop='git checkout -p'
alias gh='git log --graph --pretty=format:"%Cred%h%Creset -%C(green)%C(bold)%d%Creset %s %C(yellow)(%cr)%Creset by %an" --abbrev-commit --all'
alias gi='git init'
alias gmv='git mv'
alias grbm='git rebase master'
alias grbim='git rebase -i master'
alias grm='git rm'
alias gs='git stash'        # I prefer this to `gsta`
alias gsp='git stash pop'   # and `gstp`
alias gshow='git show'
alias gw='git add --all . && git reset --hard HEAD'

# Heroku
alias gph='git push heroku master'
alias hc='heroku config'
alias hcs='heroku config:set'

# Node/NPM
alias nd='npm run generate-docs'  #Hotham-specific
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nls='npm ls --depth 0'
alias no='npm outdated --depth 0'
alias nt='npm test'
alias nup='npm update'

# Shell
alias agi='ag -i'
alias ls='ls -AFG'
alias reload='source ~/.zshrc'

# Misc.
alias hs='http-server --cors'
