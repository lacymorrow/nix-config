{ config, lib, pkgs, ... }:

{
  system.activationScripts.postUserActivation.text = ''
    echo "Applying macOS settings..."
    ${pkgs.bash}/bin/bash ${../../dotfiles/apply-macos-settings.sh}
  '';
} 