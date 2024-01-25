#!/bin/sh

# Enable Auto-Login. Users & Groups -> Login Options -> Automatic login -> admin.
# Allow SSH. Sharing -> Remote Login
# Disable Lock Screen. Preferences -> Lock Screen -> disable "Require Password" after 5.
# Disable Screen Saver.
# Run sudo visudo in Terminal, find %admin ALL=(ALL) ALL add admin ALL=(ALL) NOPASSWD: ALL to allow sudo without a password.

# add user to passwordless sudo (required for non-interactive
# Xcode command line tools and homebrew installation)

# install xcode and tools
# xcode-select --install

# accept license prompt
# sudo xcodebuild -license

# install rosetta for any x86 apps (if needed)
# /usr/sbin/softwareupdate --install-rosetta

# install Homebrew without interaction
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install Homebrew with interaction
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add Homebrew to PATH and reload .zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zshrc
source ~/.zshrc

# Update brew and install python3
# brew update && brew upgrade
# brew install python

# add python3 to PATH
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

# add brew python to PATH. Overwrites python command to use brew python
# export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# upgrade pip
pip3 install --upgrade pip

# install ansible
pip3 install ansible

# create Projects directory in Home
# mkdir -p ~/projects
# cd ~/projects

# clone ansible mac setup repository
git clone git@github.com/geerlingguy/mac-dev-playbook.git

# install mac-setup ansible dependencies
# ansible-galaxy install -r requirements.yml

# run playbook
# ansible-playbook main.yml -i inventory --ask-become-pass
