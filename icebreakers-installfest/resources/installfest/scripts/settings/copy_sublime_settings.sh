#-------------------------------------------------------------------------------
# Copy over Sublime settiings & packages (settings/sublime_settings_settings.sh)
#-------------------------------------------------------------------------------

SUBLIME_DIR="${HOME}/Library/Application Support/Sublime Text 3"
SUBLIME_SETTINGS_DIR="${SUBLIME_DIR}/Packages/User"

# ensure files exist before copying
mkdir -p "$SUBLIME_SETTINGS_DIR"

inform "Copying Sublime settings..." true
copy_files subl_settings "$SUBLIME_SETTINGS_DIR" "$SCRIPT_SUBL_SETTINGS"
show "Complete!"
