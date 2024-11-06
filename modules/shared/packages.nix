{ pkgs }:

with pkgs; [
  # Terminal Emulators
  # alacritty

  # Core CLI Tools
  bat
  coreutils
  killall
  tree
  unzip
  wget
  # zip

  # Shell & Terminal Utilities
  # bash-completion
  # btop
  fd
  htop
  # iftop
  jq
  # neofetch
  ripgrep
  # tmux
  # unrar
  zsh-powerlevel10k

  # Development Tools
  docker
  docker-compose
  # mercurial
  # socat
  # watchman

  # Node.js & JavaScript
  nodejs
  nodePackages.npm
  nodePackages.pnpm
  nodePackages.yarn
  nodePackages.eslint
  # nodePackages.prettier

  # Python Development
  # python39
  # python39Packages.virtualenv
  # python
  # python3

  # Ruby Development
  # ruby-build
  # ruby

  # Media & Image Processing
  ffmpeg
  imagemagick

  # Security & Encryption
  gnupg
  openssh

  # System Utilities
  findutils
  gawk
  gnugrep
  gnused
  gnutar
  # sqlite

  # Text Processing & Spell Checking
  # aspell
  # aspellDicts.en
  # hunspell

  # Fonts & Typography
  # dejavu_fonts
  # emacs-all-the-icons-fonts
  # font-awesome
  # hack-font
  # jetbrains-mono
  # noto-fonts
  # noto-fonts-emoji
  # meslo-lgs-nf

  # Shell enhancements
  starship    # Cross-shell prompt
  zoxide      # Smarter cd command
  nushell     # Modern shell alternative
  asdf-vm    # Version manager
]
