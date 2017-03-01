packagelist=(
  # Autoconf is an extensible package of M4 macros that produce shell scripts
  # to automatically configure software source code packages.
  autoconf

  # Automake is a tool for automatically generating Makefile.in
  automake

  # general-purpose parser generator that converts an annotated context-free
  # grammar into an LALR or GLR parser for that grammar.
  bison

  # generic library support script
  libtool

  # a YAML 1.1 parser and emitter
  libyaml-dev

  # provides a set of functions for use by applications that allow users to
  # edit command lines as they are typed in
  libreadline6
  libreadline6-dev
  libreadline-dev

  # XML C parser and toolkit
  libxml2-dev

  # a language for transforming XML documents into other XML documents.
  libxslt1-dev

  # gnome-keyring is a daemon in the session, similar to ssh-agent,
  # and other applications can use it to store passwords and other
  # sensitive information
  # atom dependency?
  libgnome-keyring-dev

  # OpenSSL implementation of SSL
  libssl-dev
  libcurl4-openssl-dev

  # version control
  git
  git-core

  # copy to clipboard
  xclip

  # command line tool for transferring data with URL syntax
  curl

  # This software provides an abstraction of the used apt repositories.
  python-software-properties

  # a reference for all the packages needed to compile a debian package
  # generally includes the gcc/g++ compilers an libraries and some other utils
  build-essential

  # library implementing the deflate compression method found in gzip and PKZIP
  zlib1g-dev

  # generates an index file of names found in source files of various
  # programming languages.
  exuberant-ctags

  # Header files and static library for compiling C programs to link with the
  # libpq library in order to communicate with a PostgreSQL database backend.
  libpq-dev
  # or try
  # gem install pg  --   --with-pg-lib=/usr/lib

  # self-contained, serverless, transactional SQL database engine.
  sqlite3
  libsqlite3-dev

  # ASCII ART!!!!
  figlet

  # tree visualizer for filesystems
  tree

  # visualization tool for ERDs
  graphviz

  # image resizing
  imagemagick

  # headless WebKit scriptable with a JavaScript API.
  phantomjs
)

sudo apt-get -y install ${packagelist[@]}

assert_package_installed ${packagelist[@]}
