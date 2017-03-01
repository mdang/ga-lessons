# rbenv_remove_rvm.sh

inform "Removing RVM..." true

# Uninstall RVM, so that we can use rbenv
# http://stackoverflow.com/questions/3950260/howto-uninstall-rvm
if hash rvm 2>/dev/null || [ -d ~/.rvm ]; then
  yes | rvm implode
  rm -rf ~/.rvm
else
  show "RVM is not installed. Moving on."
fi
