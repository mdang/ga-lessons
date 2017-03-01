# this is a subset of the install_system_packages script for the purpose of
# setting up an ubuntu-rubyonly install

sudo apt-get -y update

# a reference for all the packages needed to compile a debian package
# generally includes the gcc/g++ compilers an libraries and some other utils
sudo apt-get -y install build-essential

# Packages required for compilation of some stdlib modules
sudo apt-get -y install tklib

# Extras for RubyGems and Rails:
sudo apt-get -y install zlib1g-dev libssl-dev

# Readline Dev on Ubuntu 12.04 LTS:
sudo apt-get -y install libreadline-gplv2-dev

# Install some nokogiri dependencies:
sudo apt-get -y install libxml2 libxml2-dev libxslt1-dev

# git for version control
sudo apt-get -y install git

# Header files and static library for compiling C programs to link with the
# libpq library in order to communicate with a PostgreSQL database backend.
sudo apt-get -y install libpq-dev

# check installs
assert_package_installed build-essential tklib zlib1g-dev libssl-dev git libpq-dev
assert_package_installed libreadline-gplv2-dev libxml2 libxml2-dev libxslt1-dev
