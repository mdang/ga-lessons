# mac/nvm_setup.sh

inform "Preparing nvm installation by cleaning up current state of Node." true

# Remove any Node brew installation and any global npm modules from it
brew remove --force node
sudo rm -r /usr/local/lib/node_modules >/dev/null 2>&1

show "Done!"
