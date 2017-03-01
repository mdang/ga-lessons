#-------------------------------------------------------------------------------
# Install rbenv (rbenv_install.sh)
#-------------------------------------------------------------------------------

inform "Installing rbenv, our Ruby version manager..." true

RBENV_DIR="$HOME/.rbenv"

if [[ -e "$RBENV_DIR" ]]; then
  show "Already installed! Moving on..."
else
  # Not using brew install (on Mac) because it is problematic...
  git clone https://github.com/sstephenson/rbenv.git "$RBENV_DIR"
fi

# enable shims and autocompletion for the rest of this script...
# this also needs to run in the bash_profile
export PATH="${RBENV_DIR}/bin:$PATH"
eval "$(rbenv init -)"

inform "Installing rbenv plugins..." true

RBENV_REHASH="${RBENV_DIR}/plugins/rbenv-gem-rehash"
RBENV_DEFAULT="${RBENV_DIR}/plugins/rbenv-default-gems"
RBENV_BUILD="${RBENV_DIR}/plugins/ruby-build"

if [[ -e "$RBENV_REHASH" ]]; then
  show "Rehash plugin already installed! Moving on..."
else
  # Automatically install gems every time you install a new version of Ruby
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git "$RBENV_REHASH"
fi

if [[ -e "$RBENV_DEFAULT" ]]; then
  show "Default gems plugin installed! Moving on..."
else
  # Automatically runs rbenv rehash every time you install or uninstall a gem
  git clone https://github.com/sstephenson/rbenv-default-gems.git "$RBENV_DEFAULT"
fi

if [[ -e "$RBENV_BUILD" ]]; then
  show "Ruby build plugin already installed! Moving on..."
else
  # Provides an `rbenv install` command
  # ruby-build is a dependency of rbenv-default-gems, so it gets installed
  # TODO (PJ) remove then?
  git clone https://github.com/sstephenson/ruby-build.git "$RBENV_BUILD"
fi

show "Complete!"
