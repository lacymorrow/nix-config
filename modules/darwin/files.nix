{ user, config, pkgs, ... }:

let
  xdg_configHome = "${config.users.users.${user}.home}/.config";
  xdg_dataHome = "${config.users.users.${user}.home}/.local/share";
in
{
  # Darwin-specific configuration files
  "${xdg_configHome}/warp/themes".source = ../../dotfiles/config/warp/themes;
}
