{ config, pkgs, ... }:

{
  # Common configuration files
  ".config/git/ignore".text = ''
    .DS_Store
    .envrc
    .direnv
    *.swp
  '';

  # ".ssh/id_github.pub" = {
  #   text = githubPublicKey;
  # };
}
