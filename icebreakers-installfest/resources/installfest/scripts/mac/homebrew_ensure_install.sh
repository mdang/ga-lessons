#-------------------------------------------------------------------------------
# Ensure Homebrew installed correctly... (mac/homebrew_ensure_install.sh)
#-------------------------------------------------------------------------------

function i_fail_without_brew() {
  command -v brew 2>/dev/null 1&>2
  if [ $? != 0 ]; then
    BREW_FAIL="true"
  fi
}

function check_ownership_of() {
  local CURR_FILE="$1"
  local OWNER=$(ls -ld "$CURR_FILE" | awk '{print $3}')

  if [ "$OWNER" != "$USER"  ]; then
    echo "Ownership problem encountered in '${CURR_FILE}'! Should be '${USER}' but is '${OWNER}'."
    BREW_FAIL="true"
    return
  else
    echo "Ownership confirmed for '${CURR_FILE}'."
  fi
}

function check_owners_in() {
  local CURR_FILE="$1"
  if [ -f "$CURR_FILE" ]; then
    check_ownership_of $CURR_FILE
  elif [ -d "$CURR_FILE" ]; then
    check_ownership_of $CURR_FILE

    local CURR_FILES="$CURR_FILE/*"
    for CURR_F in $CURR_FILES; do
      if [ -f "$CURR_F" ]; then
        check_ownership_of $CURR_F
      fi
    done
  fi
}

inform "Ensuring that Hombrew installed correctly..." true

if [ ! -d /usr/local ]; then
  fail "Could not continue: /usr/local was not created." true
  echo ""
  exit 1;
else
  echo "Hombrew folder exists."
fi

i_fail_without_brew
if [ "$BREW_FAIL" ]; then
  fail "Could not continue: Homebrew command not available." true
  echo ""
  exit 1;
else
  echo "Homebrew 'brew' command available."
fi

check_owners_in /usr/local
if [ -d /usr/local/bin ]; then
  check_owners_in /usr/local/bin
fi
if [ -d /usr/local/etc ]; then
  check_owners_in /usr/local/etc
fi
if [ -d /usr/local/var ]; then
  check_owners_in /usr/local/var
fi

if [ "$BREW_FAIL" ]; then
  fail "Could not continue; incorrect permissions in /usr/local." true
  echo ""
  exit 1
else
  echo "Permissions overview passed."
fi

show "Complete!"
