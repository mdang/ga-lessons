# Our Python version manager
# similar to the Ruby version manager rbenv, both in use and installation

# TODO (PJ) should remove other python managers like pythonz
# how to handle python versions and distributions?

git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# Add to bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/${BASH_FILE}
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/${BASH_FILE}
echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' >> ~/${BASH_FILE}

# enable shims and autocompletion
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
