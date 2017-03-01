#-------------------------------------------------------------------------------
# Use Brew to GNU's version of the core Unix utilites: ls, cat, find, etc.
# (mac/homebrew_install_core_utils.sh)
#-------------------------------------------------------------------------------

inform "Installing GNU core utils via Homebrew (gls, gcat, gfind, etc.)..." true

packagelist=(
  # The essential GNU core utilities.
  # Linked to /usr/local/bin.
  # Linked in /usr/local/opt/coreutils/libexec/gnubin without the "g"-prefix
  #   in case you want to override the OS X defaults. The default bash_profile
  #   included in /settings should have clear directions on how to do this!
  coreutils

  # Homebrew coreutils message about PATH and loading the GNU coreutils by
  # default.
  # --------------------------------------------------------------------
  # ==> Caveats
  # All commands have been installed with the prefix 'g'.
  #
  # If you really need to use these commands with their normal names, you
  # can add a "gnubin" directory to your PATH from your bashrc like:
  #
  #     PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  #
  # Additionally, you can access their man pages with normal names if you add
  # the "gnuman" directory to your MANPATH from your bashrc as well:
  #
  #     MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  # --------------------------------------------------------------------

  # More: gfind, glocate, gupdatedb, gxargs
  # Linked to /usr/local/bin.
  findutils

  # Further GNU utilities can be added with the following packages. For
  # more, see
  # https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/
  #
  # binutils
  # coreutils (--with-default-names)
  # diffutils
  # ed (--with-default-names)
  # findutils (--with-default-names)
  # gawk
  # gnu-getopt (--with-default-names)
  # gnu-indent (--with-default-names)
  # gnu-sed (--with-default-names)
  # gnu-tar (--with-default-names)
  # gnu-which (--with-default-names)
  # gnutls
  # grep (--with-default-names)
  # gzip
  # screen
  # watch
  # wdiff (--with-gettext)
  # wget
)

brew install ${packagelist[@]}

show "Complete!"
