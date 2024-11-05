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

  ".bash_prompt" = {
    text = builtins.readFile ../../home/.bash_prompt;
  };

  ".bash_profile" = {
    text = builtins.readFile ../../home/.bash_profile;
  };

  # Add docker aliases
  ".docker_aliases" = {
    text = builtins.readFile ../../home/.docker_aliases;
  };

  # Add editorconfig
  ".editorconfig" = {
    text = builtins.readFile ../../home/.editorconfig;
  };

  # Add exports
  ".exports" = {
    text = builtins.readFile ../../home/.exports;
  };

  ".functions" = {
    text = builtins.readFile ../../home/.functions;
  };

  ".gvimrc" = {
    text = builtins.readFile ../../home/.gvimrc;
  };

  ".hgrc" = {
    text = builtins.readFile ../../home/.hgrc;
  };

  ".hushlogin" = {
    text = builtins.readFile ../../home/.hushlogin;
  };

  ".inputrc" = {
    text = builtins.readFile ../../home/.inputrc;
  };

  ".npmrc" = {
    text = builtins.readFile ../../home/.npmrc;
  };

}