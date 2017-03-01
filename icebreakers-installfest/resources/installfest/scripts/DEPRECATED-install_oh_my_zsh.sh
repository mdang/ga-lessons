# The Z shell (zsh) is a Unix shell that can be used as an interactive login
# shell and as a powerful command interpreter for shell scripting. Zsh can be
# thought of as an extended Bourne shell with a large number of improvements,
# including some features of bash, ksh, and tcsh.
# This script installs zsh, oh-my-zsh, an open source, community-driven framework
# for managing your ZSH configuration.

# Install zsh
git clone git://zsh.git.sf.net/gitroot/zsh/zsh
cp ~/.zshrc ~/.zshrc.orig

# Install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Syntax Highlighting
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins

# Set as default
# chsh -s /bin/zsh

# Resources
# https://github.com/robbyrussell/oh-my-zsh
# http://www.stevendobbelaere.be/installing-and-configuring-the-oh-my-zsh-shell/
