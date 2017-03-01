# ------------------------------------------------------------------------------
# Clone the script repo locally in order to copy dotfiles etc. directly from it.
# (settings/script_repo_clone.sh)
# ------------------------------------------------------------------------------

inform "Downloading the Installfest repo, in order to copy files..." true
# download the repo for the absolute paths

if [[ $OS_VERSION == *10.6** ]]; then
  # 10.6 doesn't have git so download the zip and rename it installfest
  curl -LO https://github.com/ga-instructors/installfest_script/archive/$SCRIPT_REPO_BRANCH.zip
  unzip $SCRIPT_REPO_BRANCH.zip -d "$SCRIPT_ROOT"
  mv "$SCRIPT_ROOT/installfest-$SCRIPT_REPO_BRANCH/" "$SCRIPT_DIR"
else
  if [[ ! -d $SCRIPT_DIR ]]; then
    # autoupdate bootstrap file
    git clone -b $SCRIPT_REPO_BRANCH $SCRIPT_REPO $SCRIPT_DIR
  else
    # update repo
    echo 'Repo already downloaded; updating...'
    cd $SCRIPT_DIR
    git pull origin $SCRIPT_REPO_BRANCH
  fi
fi

show "Repo downloaded!"
