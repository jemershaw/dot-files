#!/bin/bash

packages=(
"zsh"
"vim"
"tmux"
"mtr"
"node"
"whatmask"
"docker"
"docker-compose"
"nmap"
"python"
"ipmitool"
"go"
"htop"
"cmake"
"weechat --with-perl --with-python --with-aspell --with-curl"
"docker"
"docker-compose"
"aspell"
"gist"
"openssl"
"htop"
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
"iterm2"
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
