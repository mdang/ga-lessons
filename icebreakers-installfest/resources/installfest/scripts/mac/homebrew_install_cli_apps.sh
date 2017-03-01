#-------------------------------------------------------------------------------
# Use Brew to install important CLI tools (mac/homebrew_install_core_tools.sh)
#-------------------------------------------------------------------------------

inform "Installing CLI apps via Homebrew (qt, sqlite, etc.)..." true

# Useful packages
packagelist=(
  # ASCII ART!!!!
  figlet

  # visualization tool for ERDs
  graphviz

  # Image resizing
  imagemagick

  # PhantomJS is a headless WebKit scriptable with a JavaScript API
  phantomjs

  # WebKit implementation of qt for Capybara testing
  qt

  # Qt for Mac OS X
  qt4

  # Advanced in-memory key-value store that persists on disk
  redis

  # A self-contained, serverless, zero-configuration, transactional SQL
  # database engine
  sqlite

  # Update Subversion
  # svn

  # Directory visualizer
  tree

  # Git visualization
  tig
)

brew install ${packagelist[@]}

# Note (PJ) Emacs and Vim?
# brew install emacs
# brew install vim --override-system-vi
# brew install macvim --override-system-vim --custom-system-icons

# Others...
# brew install bash
# Mac OS ships with bash 3.2
# http://www.admon.org/applications/new-features-in-bash-4-0/
# brew install gdb
# gdb requires further actions to make it work. See `brew info gdb`.
# brew install gpatch
# brew install m4
# brew install make
# brew install nano
# brew install file-formula
# brew install git
# brew install less
# brew install openssh
# brew install rsync
# brew install unzip
# brew install zsh

show "Complete!"
