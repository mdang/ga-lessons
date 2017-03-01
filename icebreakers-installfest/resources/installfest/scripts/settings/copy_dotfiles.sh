#-------------------------------------------------------------------------------
# Copy over dotfiles (settings/copy_dotfiles.sh)
#-------------------------------------------------------------------------------

inform "Copying over configuration and preference files (dotfiles)..." true
copy_files "dotfiles" "$HOME" "$(echo $SCRIPT_DOTFILES)"
show "Complete!"
