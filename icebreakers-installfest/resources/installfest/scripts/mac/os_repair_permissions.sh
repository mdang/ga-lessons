#-------------------------------------------------------------------------------
# Repair disk permissions (mac/os_repair_permissions.sh)
#-------------------------------------------------------------------------------

# Ensure user has full control over their folder
inform "Ensuring the current user owns their home folder." true
sudo chown -R ${USER} ~
show "Complete!"

# Run repair disk permissions if prior to 10.11 (El Capitan)
if [ "$OS_NUMBER" -lt "11" ]; then
  inform "Running repair permissions..." true
  inform "  Note: this may take a VERY LONG TIME!"
  diskutil repairPermissions /
  show "Complete!"
else
  inform "Skipping repair permissions, as this is disabled as of El Capitan." true
  inform "  Search for diskutil repairPermissions and System Integrity " true
  inform "  Protection on Google to learn more. "
fi

