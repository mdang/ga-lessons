#-------------------------------------------------------------------------------
# Define a utility function to copy over files (settings/util_copy_files.sh)
#-------------------------------------------------------------------------------

function copy_files () {
  # params
  local TYPE_DIR="$1"
  local TARGET_DIR="$2"
  local FILE_LIST="$3"

  # placeholder vars
  local CURRENT_FILE=""
  local TARGET_FILE=""
  local BACKUP_FILE=""
  local DOTFILES=""
  local BACKED_UP=""
  local PRINT_LN=""

  local TIMESTAMP=$(date +%s)
  local PAD="                                       "
  local BACKUP_DIR="${SCRIPT_ROOT}/${TYPE_DIR}_backups_${TIMESTAMP}"

  # check if the type of files is dotfiles
  if [[ "$TYPE_DIR" == "dotfiles" ]]; then
    DOTFILES=true
  fi

  for FILE_PATH in $FILE_LIST; do
    CURRENT_FILE=$(basename "$FILE_PATH")
    if [[ "$DOTFILES" == true ]]; then
      CURRENT_FILE=".$CURRENT_FILE" # add a dot to dotfiles
    fi

    # skip NOT-USING files
    if [[ ! $CURRENT_FILE == *"NOT-USING"* ]]; then

      # print a formatted line describing
      PRINT_LN="Copying file $CURRENT_FILE... "
      printf "%s %s" "$PRINT_LN" "${PAD:${#PRINT_LN}}"

      TARGET_FILE="${TARGET_DIR}/${CURRENT_FILE}"
      BACKUP_FILE="${BACKUP_DIR}/${CURRENT_FILE}"

      # back up files already in the target dir
      if [[ -e "$TARGET_FILE" ]]; then
        printf "(File exists! Backing up...)"
        BACKED_UP=true # save for a final message below

        # ensure the backup dir exists
        mkdir -p "$BACKUP_DIR"
        cp "$TARGET_FILE" "$BACKUP_FILE"
      fi

      # copy the file!
      cp "$FILE_PATH" "$TARGET_FILE"

      echo "" # flush printed line
    fi
  done

  if [[ "$BACKED_UP" == true ]]; then
    echo "${BOLD}Note: you can find backed-up files in ${BACKUP_DIR}${RESET}"
  fi
}

# Usage:
# copy_files dotfiles "$HOME" "$(echo $SCRIPT_DOTFILES)"
# copy_files themes "$HOME/Desktop" "TommorrowNight.theme"
