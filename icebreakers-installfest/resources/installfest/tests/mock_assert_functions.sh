# set FORCE (do not quit on error) to true if it is not loaded, as a default
: ${FORCE=true} # TODO (h4w5) since we are testing for null, this will always happen
                # switch to true/false

# use an empty function for assertions...
assert_that() {
  echo "" > /dev/null
}

# use an empty function for assertions...
assert_package_installed() {
  echo "" > /dev/null
}
