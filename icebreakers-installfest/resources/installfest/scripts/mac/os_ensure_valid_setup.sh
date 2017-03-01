#-------------------------------------------------------------------------------
# Ensure that the user's computer set up works (mac/os_ensure_valid_setup.sh)
#-------------------------------------------------------------------------------

COMP_NAME=$(scutil --get ComputerName)
LOCL_NAME=$(scutil --get LocalHostName)
HOST_NAME=$(hostname)
USER_NAME=$(id -un)
FULL_NAME=$(finger "$USER_NAME" | awk '/Name:/ {print $4" "$5}')
USER_GRPS=$(id -Gn $USER_NAME)
OS_NUMBER=$(echo $OS_VERSION | cut -d "." -f 2)
MAC_ADDRS=$(ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')

DESCRIPTION=`cat << EOFS
      Computer Type:   Mac OS $OS_VERSION
      Short user name: $USER_NAME

      Long user name:  $FULL_NAME
      Computer name:   $COMP_NAME
      LocalHost name:  $LOCL_NAME
      Full Hostname:   $HOST_NAME
      Connection MAC:  $MAC_ADDRS
EOFS`

inform "Loading your computer's information." true
inform "Your current setup is:"
printf "$DESCRIPTION\n"
inform "Checking the validity of this set up."
inform "If it is not valid, it will fail or warn you."
echo "..."

# Check if current user is admin.

if echo "$USER_GRPS" | grep -q -w admin; then
  echo "" > /dev/null
else
  fail "The current user does not have administrator privileges. You must " true
  fail "  run this program from an admin user. Ask an instructor for help."
  fail "Exiting..." true
  exit 1
fi

# Check if OS version is valid.

if [ "$OS_NUMBER" -lt "6" ]; then
  fail "You need to have Mac OS X 10.6 (Snow Leopard) or higher installed" true
  fail "  in order to take WDI. Please contact an instructor or producer."
  fail "Exiting..." true
  exit 1
fi

if [ "$OS_NUMBER" -eq "6" ]; then
  warn "Warning!" true
  warn "While you can take WDI with  Mac OS X 10.6 (Snow Leopard), it is "
  warn "  not supported by this script. You can continue to run the      "
  warn "  script, but any problems need to be taken care of by your      "
  warn "  instructional team. It is recommended that you upgrade your    "
  pause_and_warn "  computer.                                                      "
fi

# Check if username is valid.

if [[ "$USER_NAME" =~ " " ]]; then
  fail "Your username '${USER_NAME}' has a space. This complictes using " true
  fail "  command line tools, and can even break some programs. Change  "
  fail "  your username before continuing.                              "
  fail "Exiting..." true
  exit 1
fi

LOWERCASE=$(echo "$USER_NAME" | tr '[A-Z]' '[a-z]')
if [ "$USER_NAME" != "$LOWERCASE" ]; then
  warn "Warning!" true
  warn "Your username '${USER_NAME}' has 'mixed-case'; it should be entirely in "
  warn "  lowercase. This could lead to some issues where certain tools "
  warn "  that are case-sensitive, and others that are not, don't work  "
  warn "  well together. It is suggested that you change your username. "
  pause_and_warn "  PS: this also goes for your GitHub username!                  "
fi

show "Setup is valid!"
