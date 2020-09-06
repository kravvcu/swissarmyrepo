#!/bin/bash

set -e

# sudo apt update
# sudo apt upgrade --yes
# when fails run dpkg --configure -a
# when that fails run: apt install -f
# rerun upgrade
sudo apt install -y python-pip \
                    python-dev \
                    git \
                    maven \
                    colordiff \
                    at \
                    htop \
                    screen \
                    unzip \
                    xclip \
                    terminator \
                    whois

sudo pip install -U pip
sudo pip install setuptools
sudo pip install virtualenv virtualenvwrapper
sudo pip install psutil

#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#if type virtualenvwrapper.sh > /dev/null; then
#  source /usr/local/bin/virtualenvwrapper.sh
#fi

# ADJUST ALL TO AN UBUNTU / DEBIAN installation

# install tfenv: https://github.com/tfutils/tfenv
# install tgenv: https://github.com/cunymatthieu/tgenv

# zsh: ALT+F shorcut should move to end of the word not to the beginning of the next one
#
# mkvirtualenv ansible
# pip install ansible

# install go - untar to /usr/local
# export GOPATH="$HOME/.go"
# export PATH="$PATH:/usr/local/go/bin:$HOME/go"

# change gitconfig ansible so that even when user / email not provided, ansible wont change
# the current configuration

# install java from oracle or openjdk

# run ansible: shell.yml, provision.yml

# install intellij
# update knowledgebase from backup
# zsh change prompt to view kubectl context
# docker bash / zsh completion
# install signal + add to startup + hide to tray
# install discord + add to startup
# install GUI apps only when GUI is available
# install smplayer
# install fzf

# install awscli https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
# install groff, glibc and less

# add AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to .zprofile

# install `markdown-preview-mode` in emacs
# install `markdown` for the emacs markdown preview mode
