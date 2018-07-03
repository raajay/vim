#!/bin/bash

# We need a heavy version of Vim. I recommend installing vim-nox on Debian based systems
# Else, compile with "--with-features=HUGE" while installing from source

# Install Macvim
# cd macvim/src; ./configure --enable-multibyte --with-features=HUGE --enable-pythoninterp --enable-rubyinterp --with-ruby-command=/scratch/raajay/local/bin/ruby --enable-cscope
# https://github.com/b4winckler/macvim/wiki/Building

# Pull all the required submodules
git submodule update --init --recursive

# Install YouCompleteme
cd ./bundle/YouCompleteMe/; python install.py --clang-completer; cd ../../

# Install Command-t
echo "Installing command-t"
cd ./bundle/command-t/ruby/command-t/ext/command-t; ruby extconf.rb; make clean; make; cd ../../../../../..
