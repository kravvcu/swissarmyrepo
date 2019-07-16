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

# ADD
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/local/bin/virtualenvwrapper.sh

#
# mkvirtualenv ansible
# pip install ansible

# manual: install zsh (reconfigure by ansible later)
# install ohmyzsh
# reconfigure ohmyzsh theme in .zshrc
# configure zsh plugins (kube-ps1 docker) + PROMPT=$PROMPT'$(kube_ps1) '

# install java from oracle

# run ansible: shell.yml, provision.yml

# install intellij
# update knowledgebase from backup
# kubectl completion
# minikube completion
# zsh change prompt to view kubectl context
# install go compiler + configure ~/.zprofile with new PATH
# docker bash / zsh completion
# install spotify
# install signal
# install discord
