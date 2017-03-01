# atom
# Requires 64-bit
# ensure that gyp uses Python 2
sudo npm config set python /usr/bin/python2 -g
git clone https://github.com/atom/atom
cd atom
# TMPDIR=~/.wdi/tmp
# Creates application at $TMPDIR/atom-build/Atom
# TODO (phlco) move to /usr/bin
script/build
# Installs command to /usr/local/bin/atom
sudo script/grunt install
# Generates a .deb package at $TMPDIR/atom-build
script/grunt mkdeb
# TODO (phlco) command line tool for atom?
# sudo dpkg -i $TMPDIR/atom-build/Atom.deb

# TODO (pj) remove all this junk and just install with apt-get now!
