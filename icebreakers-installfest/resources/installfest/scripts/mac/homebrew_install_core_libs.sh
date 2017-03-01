#-------------------------------------------------------------------------------
# Use Homebrew to install basic libs and compilation tools
# (mac/homebrew_install_core_libs.sh)
#-------------------------------------------------------------------------------

inform "Installing core libraries via Homebrew (autoconf, automake, etc.)..." true
packagelist=(
  # Autoconf is an extensible package of M4 macros that produce shell scripts to
  # automatically configure software source code packages.
  autoconf

  # Automake is a tool for automatically generating Makefile.in
  automake

  # generic library support script
  libtool

  # a YAML 1.1 parser and emitter
  libyaml

  # neon is an HTTP and WebDAV client library
  # neon

  # A toolkit implementing SSL v2/v3 and TLS protocols with full-strength
  # cryptography world-wide.
  openssl

  # pkg-config is a helper tool used when compiling applications and libraries.
  pkg-config

  # a script that uses ssh to log into a remote machine
  ssh-copy-id

  # XML C parser and toolkit
  libxml2

  # a language for transforming XML documents into other XML documents.
  libxslt

  # a conversion library between Unicode and traditional encoding
  libiconv

  # generates an index file of names found in source files of various programming
  # languages.
  ctags

  # Adds history for node repl
  readline
)

brew install ${packagelist[@]}
show "Complete!"
