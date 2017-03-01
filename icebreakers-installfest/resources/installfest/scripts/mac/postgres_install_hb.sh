#-------------------------------------------------------------------------------
# Install Postgres (mac/postgres_install_hb.sh)
#-------------------------------------------------------------------------------

inform "Installing Postgres RDBMS via Homewbrew..." true
brew install postgresql
show "Complete!"


inform "Installing Ruby interface/genm for Postgres..." true
# from brew: "When installing the postgres gem, including ARCHFLAGS is
# recommended:"
ARCHFLAGS="-arch x86_64" gem install pg
show "Complete!"

inform "Creating Postgres data directory..." true
PGDATA="/usr/local/var/postgres"
initdb "$PGDATA" -E utf8
# TODO (PJ) set PGDATA env var in bash_profile?
show "Data directory initialized in ${PGDATA}"

inform "Attempting further configurations to ensure Postgres runs correctly..." true
# NOTE! https://coderwall.com/p/rjioeg
# Yosemite problems:
# for some reasons yosemite cleaned up some files/directories in /usr/local
# for postgres installed via homebrew the following directories were missing to
# start postgres properly:
sudo mkdir -p /usr/local/var/postgres/{pg_tblspc,pg_twophase,pg_stat_tmp}
# May also need this.
sudo chmod -R 0700 /usr/local/var/postgres
sudo chown -R ${USER} /usr/local/var/postgres
show "Complete!"

inform "Setting Postgres to launch at login..." true
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/9.*/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/
show "Complete!"


inform "Starting Postgres now..." true
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
# give postgres time to load
sleep 5s
show "Complete!"

inform "Creating a default user for Postgres..." true
# create db matching user name so we can log in by just typing psql
createdb ${USER}
show "Complete!"
