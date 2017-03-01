#-------------------------------------------------------------------------------
# Copy and install Subl packages (settings/copy_install_sublime_packages.sh)
#-------------------------------------------------------------------------------

SUBLIME_DIR="${HOME}/Library/Application Support/Sublime Text 3"
SUBLIME_PACKAGES_DIR="${SUBLIME_DIR}/Installed Packages"
SUBLIME_SETTINGS_DIR="${SUBLIME_DIR}/Packages/User"

# ensure files exist before copying
mkdir -p "$SUBLIME_PACKAGES_DIR"
mkdir -p "$SUBLIME_SETTINGS_DIR"

inform "Copying Sublime packages..." true
copy_files subl_packages "$SUBLIME_SETTINGS_DIR" "$SCRIPT_SUBL_PACKAGES"
show "Complete!"

# TODO (pj) get Package Control up and running with settings, etc.

# Install Package Control

PKG_CNTRL_URI="https://packagecontrol.io/Package%20Control.sublime-package"
PKG_CNTRL_FILE="Package Control.sublime-package"

# # NOTE (phlco) curling then mving because curl gave a malformed url in 10.6
# mkdir -p "$SRC_DIR/../packages"
# curl -O "$SRC_DIR/../packages" $PKG_CNTRL_URI
# mv "$SRC_DIR/../packages" "$SUBLIME_PACKAGES_DIR/$PKG_CNTRL_FILE"

inform "Downloading Sublime Package Control..." true
curl -o "${SUBLIME_PACKAGES_DIR}/$PKG_CNTRL_FILE" $PKG_CNTRL_URI
show "Complete!"
