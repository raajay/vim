#!/bin/bash

# We need a heavy version of Vim. I recommend installing vim-nox on Debian based systems
# Else, compile with "--with-features=HUGE" while installing from source

# Pull all the required submodules
git submodule update --init --recursive

# Install YouCompleteme
cd ./bundle/YouCompleteMe/; python install.py --clang-completer; cd ../../

# Install Command-t
cd ./bundle/command-t/ruby/command-t/; ruby extconf.rb; make; cd ../../../..
