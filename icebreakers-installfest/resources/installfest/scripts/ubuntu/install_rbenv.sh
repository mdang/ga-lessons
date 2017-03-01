# Our ruby version manager

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

assert_that "Rbenv is installed" "rbenv version"

# Specify default gems in ~/.rbenv/default-gems
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

# automatically runs rbenv rehash every time you install or uninstall a gem
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Provides an rbenv install command to compile and install different versions of Ruby
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

assert_that "Rbenv's ruby-build plugin is installed" "rbenv install"
