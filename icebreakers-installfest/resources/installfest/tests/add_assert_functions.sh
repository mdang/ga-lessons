
# set FORCE (do not quit on error) to true if it is not loaded, as a default
: ${FORCE=true} # TODO (h4w5) since we are testing for null, this will always happen
                # switch to true/false

echo_log() {
  echo "$1" >&2
}

# ex: assert_that "`gem` is installed" "gem"
# ex: assert_that "`gem` is shimmed by rbenv" "which gem" "$HOME/.rbenv/shims/gem"
# ex: assert_that "pg gem is installed" "gem list pg -i" "true"

# log the success or failure of the file...
# if only two arguments, then success is running second arg without an error
# if three, then success is the above, and when the output of running the second is equal to the third
assert_that() {
  # test for a simple error by evaling the second argument, and redirecting only
  # STDERR to a variable named ERR
  ERR=$( (eval "$2") 2>&1 >/dev/null )
  OUT=$( (eval "$2") 2>/dev/null )

  if [ -n "$ERR" ]; then # if ERR is not null, then...
    # echo failure to STDERR & STDOUT
    echo_log "${RED}$1: failure! Error: ${ERR}${RESET}"
    [ -n "$FORCE" ] || exit 1; # exit on failure if not 'forcing'
  elif [ -n "$3" ]; then # else, if there is a third argument...
    if [ "$OUT" == "$3" ]; then # and they equal
      # echo success to STDERR & STDOUT
      echo_log "${GREEN}$1...${RESET}"
    else
      # echo failure to STDERR & STDOUT if second and third arguments do not match
      echo_log "${RED}$1: failure! '$OUT' does not equal '$3'.${RESET}"
      [ -n "$FORCE" ] || exit 1; # exit on failure if not 'forcing'
    fi
  else
    # echo success to STDERR & STDOUT
    echo_log "${GREEN}$1...${RESET}"
  fi
}

# ex: assert_package_installed "git"
# ex: packagelist=( libssl-dev; libcurl4-openssl-dev; git; git-core ); assert_package_installed ${packagelist[@]}

# only works when packages share a name across OSs, otherwise easiest to write
# two assertions...
assert_package_installed() {
  for package in "$@"; do
    if [ "$OSTYPE" == "darwin" ]; then
      assert_that "${package} package is installed" "brew ls --versions ${package}" "${package}"
    elif [ "$OSTYPE" == "linux-gnu" ]; then
      assert_that "${package} package is installed" "dpkg -s ${package}"
    else
      echo_log "${RED}OS Type unknown in assertions...${RESET}" && exit 1;
    fi
  done
}
