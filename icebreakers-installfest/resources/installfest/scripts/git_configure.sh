#-------------------------------------------------------------------------------
# Add user's Git info to ~/.gitconfig (git_configure.sh)
#-------------------------------------------------------------------------------

inform "Setting Git configurations..." true

# https://www.kernel.org/pub/software/scm/git/docs/git-config.html
git config --global user.name    "$fname $lname"
git config --global user.github  $github_name
git config --global user.email   $github_email

# set colors
git config --global color.ui always

git config --global color.branch.current   "green reverse"
git config --global color.branch.local     green
git config --global color.branch.remote    yellow

git config --global color.status.added     green
git config --global color.status.changed   yellow
git config --global color.status.untracked red

# set editor
# change to `subl -w` if you want to open merge messages in Sublime.
git config --global core.editor "nano"

# default branch to push to
git config --global push.default current

# set global gitignore
git config --global core.excludesfile ~/.gitignore_global

# Turn off rerere
git config --global rerere.enabled false

# Turn off auto rebase if the user has somehow turned it on
git config --global pull.rebase false

# add commit template
git config --global commit.template ~/.gitmessage.txt

# add some useful shortcuts
git config --global alias.s 'status'
git config --global alias.sha 'rev-parse HEAD'
git config --global alias.last 'log -1 HEAD --oneline --decorate'
git config --global alias.ll 'log --oneline --decorate'
git config --global alias.set-master 'branch --set-upstream-to=origin/master master'
git config --global alias.back 'reset --soft HEAD~1'
git config --global alias.again 'commit -c ORIG_HEAD'
git config --global alias.set-deploy = "!git config --local alias.deploy \"subtree push --prefix $1 origin gh-pages\""
git config --global alias.co 'checkout'
git config --global alias.bs 'branch -v'
git config --global alias.rs 'remote -v'
git config --global alias.ci 'commit'
show "Complete!"
