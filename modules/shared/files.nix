{ pkgs, config, ... }:

{
  # Remove the Emacs init block
  # ".emacs.d/init.el" = {
  #   text = builtins.readFile ../shared/config/emacs/init.el;
  # };
}
