{ config, pkgs, lib, home-manager, ... }:

let
  user = "tmorrow.cont";
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
   ./dock
   ./system-preferences.nix
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap"; # Uninstall unmanaged packages
      upgrade = true;
    };
    
    casks = pkgs.callPackage ./casks.nix {};
    brews = pkgs.callPackage ./brews.nix {};
    # taps = [
    #   "homebrew/cask-versions"
    #   "homebrew/services"
    #   "buo/cask-upgrade"
    # ];
    # onActivation.cleanup = "uninstall";

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    # If you have previously added these apps to your Mac App Store profile (but not installed them on this system),
    # you may receive an error message "Redownload Unavailable with This Apple ID".
    # This message is safe to ignore. (https://github.com/dustinlyons/nixos-config/issues/83)

    masApps = {
      # "1password" = 1333542190;
      "Amphetamine" = 937984704;
      # "BetterSnapTool" = 417375580;
      "Flycut" = 442160987;
      "WireGuard" = 1451685025;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
        ];
        stateVersion = "23.11";
      };
      
      # Import programs directly
      programs = import ../shared/home-manager.nix { inherit config pkgs lib; };

      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local = { 
    dock = {
      enable = true;
      entries = [
        # Apps
        { path = "/Applications/System Settings.app/"; }
        { path = "/Applications/Google Chrome.app/"; }
        { path = "/Applications/Slack.app/"; }
        { path = "/Applications/zoom.us.app/"; }
        { path = "/Applications/Messages.app/"; }
        { path = "${pkgs.spotify}/Applications/Spotify.app"; }
        # { path = "/Applications/Firefox.app/"; }
        # { path = "/Applications/Safari.app/"; }
        { path = "/Applications/Utilities/Terminal.app/"; }
        { path = "/Applications/Warp.app/"; }
        { path = "/Applications/Cursor.app/"; }
        { path = "/Applications/Visual Studio Code.app/"; }

        # Folders - right side of dock
        {
          path = "/Applications";
          section = "others";
          options = "--sort name --view grid --display stack";
        }
        {
          path = "${config.users.users.${user}.home}/Downloads";
          section = "others";
          options = "--sort name --view grid --display stack";
        }
        {
          path = "${config.users.users.${user}.home}/Documents";
          section = "others";
          options = "--sort name --view grid --display stack";
        }
      ];
    };
  };
}