#-------------------------------------------------------------------------------
# Install Git Completion (git_completion.sh)
#-------------------------------------------------------------------------------

inform "Installing a bash script to support Git CLI tab-completion..." true

GIT_COMPLETION_URL="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"
GIT_COMPLETION_FILE="$HOME/.git-completion.bash"

curl -o "$GIT_COMPLETION_FILE" "$GIT_COMPLETION_URL"

if [[ -e "$GIT_COMPLETION_FILE" ]]; then
  show "File '$GIT_COMPLETION_FILE' created!"
else
  fail "${GIT_COMPLETION_FILE} not created... " true
  pause_awhile "Ask an instructor for help if necessary. "
fi
