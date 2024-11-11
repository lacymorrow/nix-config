{ agenix, config, pkgs, lib, ... }:

let user = "tmorrow.cont"; in

{

  imports = [
    ../../modules/darwin/secrets.nix
    ../../modules/darwin/home-manager.nix
    # ../../modules/darwin/system-preferences.nix
    ../../modules/shared
    agenix.darwinModules.default
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Setup user, packages, programs
  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = [ "@admin" "${user}" ];
      substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs; [
    agenix.packages."${pkgs.system}".default
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  # launchd.user.agents = {
    # emacs = {
    #   path = [ config.environment.systemPath ];
    #   serviceConfig = {
    #     KeepAlive = true;
    #     ProgramArguments = [
    #       "/bin/sh"
    #       "-c"
    #       "{ osascript -e 'display notification \"Attempting to start Emacs...\" with title \"Emacs Launch\"'; /bin/wait4path ${pkgs.emacs}/bin/emacs && { ${pkgs.emacs}/bin/emacs --fg-daemon; if [ $? -eq 0 ]; then osascript -e 'display notification \"Emacs has started.\" with title \"Emacs Launch\"'; else osascript -e 'display notification \"Failed to start Emacs.\" with title \"Emacs Launch\"' >&2; fi; } } &> /tmp/emacs_launch.log"
    #     ];
    #     StandardErrorPath = "/tmp/emacs.err.log";
    #     StandardOutPath = "/tmp/emacs.out.log";
    #   };
    # };

    # naturalScrollingToggle = {
    #   path = [ config.environment.systemPath ];
    #   serviceConfig = {
    #     KeepAlive = false;
    #     RunAtLoad = true;
    #     ProgramArguments = [
    #       "/bin/sh"
    #       "-c"
    #       "if system_profiler SPUSBDataType | grep -i \"Mouse\"; then defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false; else defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true; fi && killall Finder"
    #     ];
    #     StandardErrorPath = "/tmp/natural_scrolling.err.log";
    #     StandardOutPath = "/tmp/natural_scrolling.out.log";
    #   };
    # };
  # };
  
  system = {
    stateVersion = 4;
    # keyboard = {
    #   enableKeyMapping = true;
    #   remapCapsLockToControl = true;
    # };
  };
}
