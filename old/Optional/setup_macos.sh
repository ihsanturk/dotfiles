#!/bin/sh

# Appearance {{{1

defaults write -globalDomain AppleInterfaceStyle -string Dark

# }}}
# General {{{1

# Click in the scrollbar to: Jump to the clicked spot 
defaults write -globalDomain AppleScrollerPagingBehavior -bool true

# }}}
# Screen Saver {{{1

# Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

# }}}
# Dock {{{1

# Size:
defaults write com.apple.dock tilesize -int 45

# Magnification:
defaults write com.apple.dock magnification -bool false

# Minimize windows using: genie effect
defaults write com.apple.dock mineffect -string "genie"

# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool false

# Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.2

# Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0

# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# }}}
# Mission Controll {{{1

# Automatically rearrange Spaces based on most recent use:
defaults write com.apple.dock mru-spaces -bool false

# Dashboard:
defaults write com.apple.dock dashboard-in-overlay -bool true

# }}}
# Keyboard {{{1

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# }}}
# Trackpad {{{1

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# }}}
# Mouse & Trackpad {{{1

# Accessibility > Mouse & Trackpad > Trackpad Potions
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

# Accessibility > Mouse & Trackpad > Trackpad Potions

# }}}
# Finder {{{1

# Preferences > Show warning before changing an extension:
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Preferences > Show warning before removing from iCloud Drive:
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool true

# View > As List:
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# }}}
# Others {{{1

# Completely Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. \
	Note that some of these changes require a logout/restart to take effect."

# }}}
