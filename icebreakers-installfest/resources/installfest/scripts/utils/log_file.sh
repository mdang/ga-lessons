#-------------------------------------------------------------------------------
# Logging (utils/log_file.sh)
#-------------------------------------------------------------------------------

clear

# set up logfile
LOGFILE="$SCRIPT_ROOT/install.log"

exec > >(tee $LOGFILE); exec 2>&1

echo "Script compiled at: ${COMPILED_AT}"
echo "Script execution begun: $(date)"
echo ""
