# Checkpoints script
# Base on original checkpoints from Peter Lai to see if you computer is
# configured properly.
CHECKPOINTS=0

#######################################
# Return Assertion Message
# Arguments:
#   Message
# Returns:
#   None
#######################################
function aye () {
  msg=$1
  GREEN=$(tput setaf 2)
  RESET=$(tput sgr0)
  echo "${GREEN}$msg${RESET}"
}

#######################################
# Returns Failure Message and Increments Error count
# Globals:
#   CHECKPOINTS
# Arguments:
#   Message
# Returns:
#   None
#######################################
function nay () {
  msg=$1
  RED=$(tput setaf 1)
  RESET=$(tput sgr0)
  echo "${RED}$msg${RESET}"
  ((++CHECKPOINTS));
}

#######################################
# Instruments of Darkness
# Checks for Application
# Arguments:
#  File name
#######################################
function what_news_of () {
  app_name=$1
  echo -n "What news of $app_name? "
  # This could also work
  # if ls /path/to/your/files* &> /dev/null;
  # add support for Application folder or brew cask
  if [ -x /Applications/"$app_name".app ] || [ -x /opt/homebrew-cask/Caskroom/*/*/"$app_name".app ]; then
    aye "Good"
  else
    nay "Alack!"
  fi
}

#######################################
# Checks for existence of file
# Arguments:
#  File name
#######################################
function dost_thou_have () {
  filename=$1
  if [ -e "$filename" ]; then
    aye "Good on $filename"
  else
    nay "Thou searchest in vain for $filename"
  fi
}

#######################################
# Checks for existence command
# Arguments:
#  command
#######################################
function is_not_this () {
  cmd=$($1)
  pass=$2
  if [[ "$cmd" == *"$pass"* ]]; then
    aye "$1 is $pass"
  else
    nay "Alack! $1 is not $pass"
  fi
}

echo "Running some checks on how our install went"

is_not_this "brew doctor"           "ready to brew."
is_not_this "ruby -v"               "$BELOVED_RUBY_VERSION"
is_not_this "gem list rails -i"     "true"

# When you type `subl` into your terminal, it opens up Sublime Text
if [ ! -L /usr/local/bin/subl ]; then
  nay "sublime doesn't appear to be symlinked.";
fi

# Your root directory contains the following:
# `.gitignore_global`, `.gitconfig`, `.bash_profile`
# You should be able to open each one with `subl ~/FILENAME`
# ie `subl ~/.gitignore_global`
dost_thou_have "${HOME}/.bash_profile"
dost_thou_have "${HOME}/.gitconfig"

# Applications
what_news_of "Spectacle"
what_news_of "Sublime Text 2"
what_news_of "HipChat"
what_news_of "Google Chrome"
what_news_of "Firefox"
what_news_of "Mou"
what_news_of "Dash"

# Your ssh keys are set up
# see here https://help.github.com/articles/generating-ssh-keys for instructions

if [ $CHECKPOINTS != 0 ]; then
  exit 1;
else
  exit 0;
fi
