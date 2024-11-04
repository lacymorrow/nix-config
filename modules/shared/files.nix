{ pkgs, config, ... }:

{
  # Remove the Emacs init block
  # ".emacs.d/init.el" = {
  #   text = builtins.readFile ../shared/config/emacs/init.el;
  # };
  
  # Copy the aliases file to home directory
  ".aliases" = {
    source = ../../dotfiles/home/.aliases;
    onChange = "source ~/.aliases";
  };
}
