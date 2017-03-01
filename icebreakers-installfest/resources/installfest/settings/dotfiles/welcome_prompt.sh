#-------------------------------------------------------------------------------
# Welcome Prompt
#   prints stats on terminal load
#-------------------------------------------------------------------------------

# welcome and unwelcome functions to toggle welcome_prompt are in .bash_prompt
WELCOME_PROMPT=true

welcome_msg() {
  echo ${BG_RED}${WHITE} \
      GA${RESET}${WHITE}${BG_BLACK} \
      General Assembly ${RESET}${BG_YELLOW}${BLACK} \
      Web Development Immersive ${RESET}
  echo "------------------------------------------"
  echo $(git --version)
  if which brew >/dev/null; then
    echo $(brew -v)
  fi
  echo $(ruby -v)
  echo "node $(node --version)"
  echo $(psql --version)
  # echo $(heroku --version)
  # TODO (PJ) add tests for MongoDB, that there is a PG db for the current user
  echo "------------------------------------------"
  echo "type ${BOLD}unwelcome${RESET} to remove this message"
}

if [[ $WELCOME_PROMPT == true ]]; then welcome_msg; fi

