#-------------------------------------------------------------------------------
# Handle Command Line Options (utils/handle_options_and_start_logging.sh)
#-------------------------------------------------------------------------------

while getopts "vf" FLAG; do
  case $FLAG in
    f ) FORCE=true;;
    v ) VERBOSE=true;;
    ? ) exit 2;;
  esac
done

#-------------------------------------------------------------------------------
# Logging (utils/handle_options_and_start_logging.sh)
#-------------------------------------------------------------------------------

# set up logfile
LOGFOLDER="$HOME/.wdi"; mkdir -p $LOGFOLDER
LOGFILE="$LOGFOLDER/install.log"

# if we are logging verbosely
#   echo_log() & assert_that() -> stderr -> stdout -> *logfile* -> console
# else we are only logging assertions ([- n "$verbose" ] == false)
#   echo_log() & assert_that() -> stderr -> *logfile* -> stdout -> console
# this is done by:
#   a. directing echo_log() & assert_that() to stderr, via
#      {echo "" >&2}, and ...
echo_log() {
  echo "$1" >&2
}

if [ -n "$VERBOSE" ]; then
#     b. executing the script so that stdout 'tee's to logfile, via
#        {exec 1> >(tee logfile)} | {exec > >(tee logfile)}
#     c. executing the script so that stderr redirects to stdout, via
#        {exec 2>&1}
  exec > >(tee $LOGFILE); exec 2>&1
else
#     b. executing the script so that stderr 'tee's to logfile, via
#        {exec 2> >(tee logfile)}
  exec 2> >(tee $LOGFILE)
fi

echo_log
echo_log "Script execution begun: $(date)"
if [ -n "$FORCE" ]; then
  echo_log " Force option set to true: will continue script despite failed assertions."
else
  echo_log " Script will exit on failed assertions. Use -f option to force completion."
fi

if [ -n "$VERBOSE" ]; then
  echo_log " Verbose logging option set to true: will log all output, not just errors, log statements and assertions."
else
  echo_log " Script will log errors, log statements and assertions only. Use -v option to log verbosely."
fi
echo_log
