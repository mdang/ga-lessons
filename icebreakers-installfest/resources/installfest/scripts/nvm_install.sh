#-------------------------------------------------------------------------------
# Install NVM (nvm_install.sh)
#-------------------------------------------------------------------------------

inform "Installing nvm, our Node version manager..." true

NVM_DIR="$HOME/.nvm"

if [[ -e "$NVM_DIR" ]]; then
  show "Already installed. Moving on..."
else
  # install Node Version Manager
  git clone https://github.com/creationix/nvm.git "$NVM_DIR" && cd "$NVM_DIR" && git checkout `git describe --abbrev=0 --tags`
  show "Complete!"
fi
