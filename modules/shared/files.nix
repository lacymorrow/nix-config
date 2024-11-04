{ pkgs, config, ... }:

{
  # Remove the Emacs init block
  # ".emacs.d/init.el" = {
  #   text = builtins.readFile ../shared/config/emacs/init.el;
  # };
  
  # Copy the aliases file to home directory
  ".aliases" = {
    text = builtins.readFile ../../home/.aliases;
  };

  # Add editorconfig
  ".editorconfig" = {
    text = builtins.readFile ../../home/.editorconfig;
  };

  # Add exports
  ".exports" = {
    text = builtins.readFile ../../home/.exports;
  };

  ".npmrc" = {
    text = builtins.readFile ../../home/.npmrc;
  };

  
}