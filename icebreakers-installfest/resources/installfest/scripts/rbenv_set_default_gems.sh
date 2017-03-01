#-------------------------------------------------------------------------------
# Set default gems to install by rbenv (rbenv_set_default_gems.sh)
#-------------------------------------------------------------------------------

inform "Setting default gems to install with Ruby versions..." true

# Make sure we skip documentation installation during install...
# There is a more full .gemrc that will be installed with dotfiles later.
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

touch "${RBENV_DIR}/default-gems"

# Our gems to install
GEMLIST=(
  bundler         # Maintains a consistent environment for ruby applications.
  # capybara        # Acceptance test framework for web applications
  # guard           # handle events on file system modifications
  # jasmine         # JavaScript testing
  pry             # alternative to the standard IRB shell
  # pry-coolline    # live syntax highlighting for the Pry REPL
  # rails           # full stack, Web application framework
  # rspec           # testing tool for Ruby
  # sinatra         # a DSL for quickly creating web applications in Ruby
  # sinatra-contrib # common Sinatra extensions
  github_api      # Ruby interface to github API v3
  # hipchat         # HipChat HTTP API Wrapper
  awesome_print   # pretty print your Ruby objects with style
  rainbow         # colorizing printed text on ANSI terminals
)

for gem in ${GEMLIST[@]}; do
  echo "${gem}" >> "${RBENV_DIR}/default-gems"
done

show "Complete!"
