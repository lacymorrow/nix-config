{ config, lib, pkgs, ... }:

{
  system.defaults = {
    # Dock settings
    dock = {
      # Automatically hide and show the Dock
      autohide = true;
      # Remove the auto-hiding Dock delay
      autohide-delay = 0.0;
      # Remove the animation when hiding/showing the Dock
      autohide-time-modifier = 0.0;
      # Speed up Mission Control animations
      expose-animation-duration = 0.1;
      # Change minimize/maximize window effect
      mineffect = "scale";
      # Minimize windows into their application's icon
      minimize-to-application = true;
      # Enable highlight hover effect for the grid view of a stack
      mouse-over-hilite-stack = true;
      # Don't automatically rearrange Spaces based on most recent use
      mru-spaces = false;
      # Show indicator lights for open applications
      show-process-indicators = true;
      # Don't show recent applications
      show-recents = false;
      # Make Dock icons of hidden applications translucent
      showhidden = true;
      # Don't show only open applications
      static-only = false;
      # Set the icon size of Dock items
      tilesize = 36;
    };

    # Finder settings
    finder = {
      # Show all filename extensions
      AppleShowAllExtensions = true;
      # Show hidden files by default
      AppleShowAllFiles = true;
      # Show icons on desktop
      CreateDesktop = true;
      # When performing a search, search the current folder by default
      FXDefaultSearchScope = "SCcf";
      # Disable the warning when changing a file extension
      FXEnableExtensionChangeWarning = false;
      # Use column view in all Finder windows by default
      FXPreferredViewStyle = "clmv";
      # Allow quitting Finder via ⌘ + Q
      QuitMenuItem = true;
      # Show path bar
      ShowPathbar = true;
      # Show status bar
      ShowStatusBar = true;
      # Display full POSIX path as Finder window title
      _FXShowPosixPathInTitle = true;
    };

    # Global system settings
    NSGlobalDomain = {
      # Enable full keyboard access for all controls
      AppleKeyboardUIMode = 3;
      # Show all filename extensions
      AppleShowAllExtensions = true;
      # Always show scrollbars
      AppleShowScrollBars = "Always";
      # Disable automatic capitalization
      NSAutomaticCapitalizationEnabled = false;
      # Disable smart dashes
      NSAutomaticDashSubstitutionEnabled = false;
      # Disable smart quotes
      NSAutomaticQuoteSubstitutionEnabled = false;
      # Disable auto-correct
      NSAutomaticSpellingCorrectionEnabled = false;
      # Expand save panel by default
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      # Expand print panel by default
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
      # Disable "natural" scrolling
      "com.apple.swipescrolldirection" = false;
      # Enable tap to click
      "com.apple.trackpad.enableSecondaryClick" = true;
      # Enable corner secondary click
      "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
      # Set keyboard repeat rate (lower is faster)
      InitialKeyRepeat = 20;
      KeyRepeat = 5;
    };

    # Login window settings
    loginwindow = {
      # Disable guest account
      GuestEnabled = false;
      # Don't show full name in login window
      SHOWFULLNAME = false;
    };

    # Trackpad settings
    trackpad = {
      # Enable tap to click
      Clicking = true;
      # Enable right click
      TrackpadRightClick = true;
      # Enable three finger drag
      TrackpadThreeFingerDrag = true;
      # Enable silent clicking
      ActuationStrength = 1;
    };

    # Universal Access settings
    universalaccess = {
      # Use scroll gesture with modifier key to zoom
      closeViewScrollWheelToggle = true;
      # Follow keyboard focus while zoomed in
      closeViewZoomFollowsFocus = true;
    };

    # Activity Monitor settings
    ActivityMonitor = {
      # Show the main window when launching
      OpenMainWindow = true;
      # Show all processes
      ShowCategory = 0;
      # Sort by CPU usage
      SortColumn = "CPUUsage";
      SortDirection = 0;
      # Visualize CPU usage in Dock icon
      IconType = 5;
    };

    # Screencapture settings
    screencapture = {
      # Save screenshots to Desktop
      location = "~/Desktop";
      # Save screenshots as PNG
      type = "png";
      # Disable shadow in screenshots
      disable-shadow = true;
    };

    # Spaces settings
    spaces = {
      # Don't automatically rearrange spaces based on use
      spans-displays = true;
    };

    # Menubar settings
    menuExtraClock = {
      # Show date in menubar
      ShowDate = 1;
      # Show seconds
      ShowSeconds = true;
      # Use 24-hour time
      Show24Hour = true;
    };

    # Additional NSGlobalDomain settings
    NSGlobalDomain = {
      # Window settings
      NSWindowResizeTime = 0.001;
      NSDocumentSaveNewDocumentsToCloud = false;  # Save to disk by default
      NSTextShowsControlCharacters = true;
      NSDisableAutomaticTermination = true;
      
      # Keyboard settings
      ApplePressAndHoldEnabled = false;  # Disable press-and-hold for keys
    };
  };

  # System-wide settings that require scripting
  system.activationScripts.postUserActivation.text = ''
    # Show all mounted volumes on desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    # Disable the "Are you sure you want to open this application?" dialog
    defaults write com.apple.LaunchServices LSQuarantine -bool false

    # Disable disk image verification
    defaults write com.apple.frameworks.diskimages skip-verify -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
    defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

    # Hot corners
    # Possible values:
    #  0: no-op
    #  2: Mission Control
    #  3: Show application windows
    #  4: Desktop
    #  5: Start screen saver
    #  6: Disable screen saver
    #  7: Dashboard
    # 10: Put display to sleep
    # 11: Launchpad
    # 12: Notification Center
    defaults write com.apple.dock wvous-tl-corner -int 2
    defaults write com.apple.dock wvous-tr-corner -int 4
    defaults write com.apple.dock wvous-bl-corner -int 5
    defaults write com.apple.dock wvous-br-corner -int 12

    # Transmission settings
    defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
    defaults write org.m0k.transmission IncompleteDownloadFolder -string "$HOME/Documents/Torrents"
    defaults write org.m0k.transmission DownloadLocationConstant -bool true
    defaults write org.m0k.transmission DownloadAsk -bool false
    defaults write org.m0k.transmission MagnetOpenAsk -bool false
    defaults write org.m0k.transmission BlocklistNew -bool true
    defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
    defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
    defaults write org.m0k.transmission RandomPort -bool true

    # Chrome settings
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome DisablePrintPreview -bool true
    defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

    # Terminal settings
    defaults write com.apple.terminal StringEncodings -array 4
    defaults write com.apple.terminal SecureKeyboardEntry -bool true
    defaults write com.apple.Terminal ShowLineMarks -int 0

    # TextEdit settings
    defaults write com.apple.TextEdit RichText -int 0
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

    # Spotlight settings
    sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
    sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

    # App Store settings
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true
    defaults write com.apple.appstore ShowDebugMenu -bool true
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
    defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
    defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
    defaults write com.apple.commerce AutoUpdate -bool true

    # Kill affected applications
    /usr/bin/killall Finder
    /usr/bin/killall Dock
    /usr/bin/killall SystemUIServer
    for app in "Activity Monitor" "Photos" "Safari" "SystemUIServer" "Terminal" "Transmission"; do
      killall "$app" > /dev/null 2>&1 || true
    done

    # Spotlight settings
    sudo mdutil -i off "/Volumes/Macintosh HD" 2>/dev/null  # Disable indexing
    sudo mdutil -E "/Volumes/Macintosh HD" 2>/dev/null      # Erase index
    sudo mdutil -i on "/Volumes/Macintosh HD" 2>/dev/null   # Enable indexing

    # Energy saving
    sudo pmset -a hibernatemode 0
    sudo pmset -a autopoweroff 0
    sudo pmset -a standby 0
    sudo pmset -a proximitywake 0

    # Network settings
    sudo networksetup -setairportpower en0 on
    
    # Disable the sound effects on boot
    sudo nvram SystemAudioVolume=" "

    # Expand save panel by default
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

    # Disable automatic termination of inactive apps
    defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

    # Disable automatic capitalization
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

    # Disable smart quotes and dashes
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

    # Disable auto-correct
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

    # Stop iTunes from responding to keyboard media keys
    launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null

    # Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0

    # Save screenshots to the desktop
    defaults write com.apple.screencapture location -string "$HOME/Desktop"

    # Avoid creating .DS_Store files on network or USB volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

    # Show the ~/Library folder
    chflags nohidden ~/Library

    # Show the /Volumes folder
    sudo chflags nohidden /Volumes
  '';
} 