#-------------------------------------------------------------------------------
# Check for & install commandline tools (mac/os_install_commandline_tools.sh)
#-------------------------------------------------------------------------------

inform "Checking for XCode Command Line Tools..." true

# Check that command line tools are installed
case $OS_VERSION in
  *10.12*) cmdline_version="CLTools_Executables" ;; # Sierra
  *10.11*) cmdline_version="CLTools_Executables" ;; # El Capitan
  *10.10*) cmdline_version="CLTools_Executables" ;; # Yosemite
  *10.9*)  cmdline_version="CLTools_Executables" ;; # Mavericks
  *10.8*)  cmdline_version="DeveloperToolsCLI"   ;; # Mountain Lion
  *10.7*)  cmdline_version="DeveloperToolsCLI"   ;; # Lion
  *10.6*)  cmdline_version="DeveloperToolsCLILeo"
           fail "Outdated OS. Considering upgrading before continuing." true;; # Snow Leopard
           # Force the user to upgrade if they're below 10.6
  *) fail "Sorry! You'll have to upgrade your OS to $MINIMUM_MAC_OS or above." true; exit 1;;
esac

# Check for Command Line Tools based on OS versions
if [ ! -z $(pkgutil --pkgs=com.apple.pkg.$cmdline_version) ]; then
  show "Command Line Tools are installed!"
elif [[ $OS_VERSION == *10.6** ]]; then
  fail "Command Line Tools are not installed!" true
  fail "  Downloading and installing the GCC compiler."
  fail "  When you're done rerun the Installfest script..."
  curl -OLk https://github.com/downloads/kennethreitz/osx-gcc-installer/GCC-10.6.pkg
  open GCC-10.6.pkg
  exit 1
elif [[ $OS_VERSION == *10.7* ]] || [[ $OS_VERSION == *10.8* ]]; then
  fail "Command Line Tools are not installed!" true
  fail "Register for a Developer Account"
  fail "  Download the Command Lion Tools from:"
  fail "    https://developer.apple.com/downloads/index.action"
  fail "  and then rerun the Installfest script..."
  exit 1
else
  fail "Command Line Tools are not installed!" true
  fail "  Running 'xcode-select --install' Please click continue!"
  fail "  After installing please rerun the Installfest script..."
  xcode-select --install
  exit 1
fi
