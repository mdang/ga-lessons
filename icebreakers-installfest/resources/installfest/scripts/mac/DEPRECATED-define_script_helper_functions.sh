# NOW JUST DOING THIS BY HAND... (For Spectacle...)

#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------

# Allow apps to control your computer
allow_control() {
  if [[ "$OSTYPE" =~ ^darwin13.*$ ]]; then
    for app; do
      APP_ID="$(osascript -e "id of app \"$app\"")"
      if [[ -n "$APP_ID" ]]; then
        sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT or REPLACE INTO access values ('kTCCServiceAccessibility', '$APP_ID', 0, 1, 0, NULL);"
      fi
    done
  else
    fail "allow_control works only on Mavericks or newer..."
  fi
}
