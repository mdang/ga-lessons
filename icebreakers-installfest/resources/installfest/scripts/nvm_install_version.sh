#-------------------------------------------------------------------------------
# Install Node (nvm_install_version.sh)
#-------------------------------------------------------------------------------

inform "Installing correct Node version and updated NPM..." true

# load nvm command in the script
# will do this and more in the bash_profile for the users
source ~/.nvm/nvm.sh

# Install and use version using NVM
nvm install "$NODE_VERSION"

# Ensure we have the most recent version of npm
npm install npm -g

show "Complete!"
