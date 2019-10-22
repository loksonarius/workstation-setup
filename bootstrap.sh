#!/usr/bin/env bash
# bootstrap.sh
# Sets up OSX machine from scratch so that it can run the Ansible playbooks

# Bail out if any command fails
set -e

# Install brew
brew_install_script="$(\
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install \
)"
/usr/bin/ruby -e "${brew_install_script}"

# Install Python
brew install python

# Set up Python virtual env
python3 -m venv --prompt workstation-venv venv

# Install Ansible
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
