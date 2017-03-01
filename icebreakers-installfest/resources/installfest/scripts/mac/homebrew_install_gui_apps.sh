#-------------------------------------------------------------------------------
# Use Brew Cask to install application images (mac/homebrew_install_apps.sh)
#-------------------------------------------------------------------------------

# PJ: REMOVED THE BELOW, now that cask has been added to Homebrew
# See https://github.com/caskroom/homebrew-cask/pull/15381

# inform "Installing Homebrew Cask, to handle Mac binaries (apps)..." true
# a CLI workflow for the administration of Mac applications
# distributed as binaries
# brew tap phinze/homebrew-cask
# brew install brew-cask

# PJ: Removed the below, now that it seems Sublime Text 3 is the default
# package for Homebrew, and sublime-text3 no longer exists…
# https://github.com/caskroom/homebrew-cask/pull/22236

# load a tap of different versions of apps (for Sublime Text 3)
# inform "Tapping Homebrew Cask's versions, for ST3..." true
# brew tap caskroom/versions
# show "Complete!"

inform "Using Homebrew Cask to install GUI apps..." true

# PJ: removed b/c too many students were afraid of having double
# installs. Added note to README to this effect.

# Our browser(s)
# ----------------------------------------------------------------------
# brew cask install google-chrome
# brew cask install google-chrome-canary

# brew cask install firefox
# brew cask install firefox-nightly
# ----------------------------------------------------------------------

# Out text editor
# ----------------------------------------------------------------------
# The Text Editor, Sublime Text 3
# (phlco) atom won't support files over 2mb therefore we'll hold off.

brew cask install sublime-text
# ----------------------------------------------------------------------

# Our productivity suite
# ----------------------------------------------------------------------
# Our chat client
brew cask install slack

# Our window manager
brew cask install spectacle

# A screenshot sharing tool
brew cask install mac2imgur

# A clipboard enhancer
brew cask install jumpcut

# Flux, makes the color of your computer's display adapt to the time of day
# brew cask install flux

# An alternative terminal
# brew cask install iterm2
# ----------------------------------------------------------------------

# List of useful Quick Look plugins for developers
# See http://www.makeuseof.com/tag/quick-look-plugins-make-file-browsing-os-x-even-better/
# ----------------------------------------------------------------------
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json
# brew cask install qlprettypatch quicklook-csv betterzipql
# brew cask install webp-quicklook suspicious-package
# ----------------------------------------------------------------------

# The X Window Server
# ----------------------------------------------------------------------
# See:
#   - https://en.wikipedia.org/wiki/XQuartz
#   - https://support.apple.com/en-us/HT201341
# Cross-platform *nix window server, useful for a number of developer
# and open-source tools (Inkscape, Gimp, Meld, etc.)
brew cask install xquartz
# ----------------------------------------------------------------------

show "Complete!"
