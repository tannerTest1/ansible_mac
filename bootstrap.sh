#!/bin/sh

# install xcode and tools
xcode-select --install
sudo xcodebuild -license

# install rosetta for any x86 apps
/usr/sbin/softwareupdate --install-rosetta

# install Homebrew without interaction
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add Homebrew to PATH through .zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc 
source ~/.zshrc 

# Update brew and install python3
brew update && brew upgrade
brew install python

# add brew python to PATH. Overwrites python command to use brew python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# upgrade pip
pip install --upgrade pip

# install ansible
pip install --force-reinstall ansible

# create Projects directory in Home
mkdir -p projects
cd projects

# clone ansible mac setup repository
git clone <url to repository>

# cd into cloned repository
cd mac-setup

# install mac-setup ansible dependencies
ansible-galaxy install -r requirements.yml

# run playbook
ansible-playbook main.yml -i inventory --ask-become-pass
BECOME password: