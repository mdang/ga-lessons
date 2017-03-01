# Google Chrome.........The Browser
# HipChat...............The Chat Client
# Sublime Text 2........The Text Editor

# chrome
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get -y update
sudo apt-get -y install google-chrome-stable

# hipchat
# sudo sh -c 'echo "deb http://downloads.hipchat.com/linux/apt stable main" > /etc/apt/sources.list.d/atlassian-hipchat.list'
# wget -O - https://www.hipchat.com/keys/hipchat-linux.key | sudo apt-key add -
# sudo apt-get -y update
# sudo apt-get -y install hipchat

# sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo apt-get -y update
sudo apt-get -y install sublime-text

# zsh
# sudo apt-get -y install zsh

# flux
# sudo add-apt-repository -y ppa:kilian/f.lux
# sudo apt-get -y update
# sudo apt-get -y install fluxgui

# hub
git clone https://github.com/github/hub.git
cd hub
# TODO (phlco) permission problems... sudo chown -R `whoami` /usr/local/* ?
rake install prefix=/usr/local

# vim
sudo apt-get -y install vim

# emacs
# sudo apt-get -y install emacs
