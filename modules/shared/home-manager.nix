{ config, pkgs, lib, ... }:

{
  programs = {
    # Shell configuration
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      initExtra = builtins.readFile ../../dotfiles/home/.zshrc;
      shellAliases = lib.importJSON ../../dotfiles/home/.aliases;
    };

    # Git configuration
    git = {
      enable = true;
      userName = "Lacy Morrow";
      userEmail = "me@lacymorrow.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
        push = {
          default = "simple";
          followTags = true;
        };
        core = {
          whitespace = "space-before-tab,-indent-with-non-tab,trailing-space";
          trustctime = false;
          precomposeunicode = false;
          untrackedCache = true;
        };
        help.autocorrect = 1;
        merge.log = true;
        diff = {
          renames = "copies";
        };
        color = {
          ui = "auto";
          branch = {
            current = "yellow reverse";
            local = "yellow";
            remote = "green";
          };
          diff = {
            meta = "yellow bold";
            frag = "magenta bold";
            old = "red";
            new = "green";
          };
          status = {
            added = "yellow";
            changed = "green";
            untracked = "cyan";
          };
        };
      };
    };

    # Shell prompt
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };

  # Import your dotfiles
  home.file = {
    ".aliases".source = ../../dotfiles/home/.aliases;
    ".bash_profile".source = ../../dotfiles/home/.bash_profile;
    ".bash_prompt".source = ../../dotfiles/home/.bash_prompt;
    ".bashrc".source = ../../dotfiles/home/.bashrc;
    ".docker_aliases".source = ../../dotfiles/home/.docker_aliases;
    ".editorconfig".source = ../../dotfiles/home/.editorconfig;
    ".exports".source = ../../dotfiles/home/.exports;
    ".functions".source = ../../dotfiles/home/.functions;
    ".gvimrc".source = ../../dotfiles/home/.gvimrc;
    ".hgrc".source = ../../dotfiles/home/.hgrc;
    ".hushlogin".source = ../../dotfiles/home/.hushlogin;
    ".inputrc".source = ../../dotfiles/home/.inputrc;
  };
}
