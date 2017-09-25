#!/bin/bash

# disable iphoto launch when connecting iphone/ipad
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# enable text replacement shortcuts in all apps
defaults write -g WebAutomaticTextReplacementEnabled -bool true

# disable transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# move dock to left and minimize with scale
defaults write com.apple.dock orientation -string bottom 
defaults write com.apple.dock mineffect -string scale

# use normal scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# dont write .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES

# skip disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# check for updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# use current folder as finder search scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# show hard drives and externals on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# map bottom right corner to right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 &&
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2 &&
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 0 &&
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 0 &&
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 &&
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# expand save panel by defalt
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# save to disk (not to icloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Reveal IP address, hostname, OS version, etc. via clock in login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# show filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# disable sound effect when changing volume
defaults write -g com.apple.sound.beep.feedback -integer 0

# show ~/Library
chflags nohidden ~/Library

# show abs path in finder title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

# hide path bar in finder
defaults write com.apple.finder ShowPathbar -bool false

# disable bouncing dock icons
defaults write com.apple.dock no-bouncing -bool true

# graphite buttons
# defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# large sidebar icons
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 3

# menu bar battery show percentage off
defaults write com.apple.menuextra.battery ShowPercent -string "NO"

# dock icon sizing
defaults write com.apple.dock tilesize -int 42

# disk utility
# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# default to list view in Finder windows (others: `icnv`, `clmv`, `Flwv`)
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# disable local time machine backups
sudo tmutil disablelocal

# Disable animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnable -bool false

# make keyboard react faster
defaults write NSGlobalDomain KeyRepeat -int 0

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

killall Dock;
killall Finder;
