#!/bin/bash

# Xcode needs to be install for OSX
if [ "$(uname -s)" == "Darwin" ] && ! xcode-select -p > /dev/null
then
  echo "Installing xCode, this is required for osx"
  xcode-select --install
  read -n 1 -s -r -p "Press any key to continue when install completed"
else
  echo "xCode is installed, nothing to do here"
fi

# Install homebrew 
if [ -f "/usr/local/bin/brew" ]
then
  echo "Homebrew is installed, nothing to do here"
else
  echo "Homebrew is not installed, installing now"
  echo "This may take a while"
  echo "Homebrew requires osx command lines tools, please download xcode first"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

packages=(
"zsh"
"git"
"node"
"tmux"
"mtr"
"whatmask"
"docker"
"docker-compose"
"nmap"
"python"
"ipmitool"
"go"
"htop"
"cmake"
"weechat"
"vim"
)
packages_installed=$(brew list)

# Installing brew packages
for package in ${packages[@]};
do
  if [[ "${packages_installed[@]}" =~ "$package" ]]
  then
    echo "$package is installed, nothing to do here"
  else
    echo "installing $package"
    brew install $package
  fi
done

caskpackages=(
"spectacle"
"iterm2-nightly"
"alfred"
"openzfs"
"omnigraffle"
"google-chrome"
"wireshark"
"enpass"
"mattermost"
"zoomus"
"vmware-fusion"
"google-play-music-desktop-player"
"firefoxnightly"
"apache-directory-studio"
)
caskpackages_installed=$(brew cask list)

# Installing cask packages
for package in ${caskpackages[@]};
do
  if [[ "${caskpackages_installed[@]}" =~ "$package" ]]
  then
    echo "$package is installed, nothing to do here"
  else
    brew cask install $package
  fi
done
