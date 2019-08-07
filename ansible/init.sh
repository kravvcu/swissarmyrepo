#!/bin/bash

set -e

sudo apt update
sudo apt upgrade --yes
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
                    terminator

sudo pip install -U pip
sudo pip install setuptools
sudo pip install virtualenv virtualenvwrapper
sudo pip install psutil

# ADJUST ALL TO AN UBUNTU / DEBIAN installation

# ADD
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/local/bin/virtualenvwrapper.sh

# zsh: ALT+F shorcut should move to end of the word not to the beginning of the next one

#
# mkvirtualenv ansible
# pip install ansible

# change gitconfig ansible so that even when user / email not provided, ansible wont change
# the current configuration

# configure zsh plugins (kube-ps1 docker) + PROMPT=$PROMPT'$(kube_ps1) '

# add synapse to startup

# install java from oracle or openjdk

# run ansible: shell.yml, provision.yml

# install intellij
# update knowledgebase from backup
# kubectl completion
# minikube completion
# zsh change prompt to view kubectl context
# install go compiler + configure ~/.zprofile with new PATH
# docker bash / zsh completion
# install signal + add to startup + hide to tray
# install discord + add to startup
# install GUI apps only when GUI is available
