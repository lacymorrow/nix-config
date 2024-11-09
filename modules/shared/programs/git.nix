{ config, pkgs, lib, ... }:

let 
  name = "Lacy Morrow";
  email = "me@lacymorrow.com";
in {
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    lfs.enable = true;

    aliases = {
      l = "log --pretty=oneline -n 20 --graph --abbrev-commit";
      s = "status -s";
      d = "!git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat";
      p = "pull --recurse-submodules";
      c = "clone --recursive";
      ca = "!git add -A && git commit -av";
      go = "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f";
      # ... rest of your git aliases
    };

    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "vim";
        autocrlf = "input";
        whitespace = "space-before-tab,-indent-with-non-tab,trailing-space";
      };
      # ... rest of your git config
    };

    ignores = [
      ".DS_Store"
      ".envrc"
      ".direnv"
      "*.swp"
      # ... rest of your ignores
    ];
  };
} 