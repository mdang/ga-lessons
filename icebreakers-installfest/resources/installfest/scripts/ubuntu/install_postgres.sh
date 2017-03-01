# open source object-relational database management system
# https://www.digitalocean.com/community/articles/how-to-install-and-use-postgresql-on-ubuntu-12-04
# TODO phlco set up user
# https://help.ubuntu.com/community/PostgreSQL
# sudo apt-get -y install postgresql-xc-client
# sudo apt-get -y install postgresql-client
# sudo apt-get -y install postgresql
# sudo apt-get -y install postgresql-contrib
# sudo apt-get -y install pg_ctl # initialize stop/start posgres
sudo apt-get -y install postgresql
sudo apt-get -y install postgresql-contrib
sudo apt-get -y install libpq-dev # should fix issue with installing pg gem

sudo -u postgres createuser --superuser $USER
# TODO phlco. taking out?
# sudo -u postgres psql
# create a history?
touch ~/.psql_history

createdb $USER

# Install ruby interface for Postgres
gem install pg