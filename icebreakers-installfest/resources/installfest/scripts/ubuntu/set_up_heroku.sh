# Heroku command-line tooling for working with the Heroku platform

# http://eoinoc.net/install-hub-github-linux-mint/
# wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
# from the above, but using our current environment:

# add heroku repository to apt
sudo sh -c 'echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list'

# install heroku's release key for package verification
wget -O- https://toolbelt.heroku.com/apt/release.key | sudo apt-key add -

# update your sources with heroku packages
sudo apt-get update -y

# install the toolbelt
sudo apt-get install -y heroku-toolbelt

# https://devcenter.heroku.com/articles/keys
# FIXME pj@ga.co: not working as it is -- can't find `heroku`
# echo "Heroku is a cloud platform as a service (PaaS) supporting several"
# echo "programming languages."

# echo "If you don’t already use SSH, you’ll need to create a public/private key"
# echo "pair to deploy code to Heroku. This keypair is used for the strong"
# echo "cryptography and that uniquely identifies you as a developer when pushing"
# echo "code changes."

# ssh-keygen -t rsa

# echo "The first time you run the heroku command, you’ll be prompted for your "
# echo "credentials. Your public key will then be automatically uploaded to"
# echo "Heroku. This will allow you to deploy code to all of your apps."
# echo "Please enter your email"

# heroku keys:add
