{ pkgs }:

with pkgs; [
  # Shell utilities
  bat
  coreutils
  findutils
  gawk
  gnused
  gnutls
  less
  tree
  wget
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting

  # Development tools
  git
  nodejs
  yarn
  pnpm
  docker
  docker-compose

  # System utilities
  ffmpeg
  imagemagick
  trash-cli
  wget
  
  # Additional tools from your Brewfile
  mas # Mac App Store CLI

      # General packages for development and system management
  alacritty
  # aspell
  # aspellDicts.en
  # bash-completion
  # bat
  # btop
  # coreutils
  # killall
  # neofetch
  # openssh
  # sqlite
  # wget
  # zip
  # # Cloud-related tools and SDKs
  # docker
  # docker-compose

  # # Media-related packages
  # emacs-all-the-icons-fonts
  # dejavu_fonts
  # ffmpeg
  # fd
  # font-awesome
  # hack-font
  # noto-fonts
  # noto-fonts-emoji
  # meslo-lgs-nf

  # # Node.js development tools
  # nodePackages.npm # globally install npm
  # nodePackages.prettier
  # nodejs

  # # Text and terminal utilities
  # htop
  # hunspell
  # iftop
  # jetbrains-mono
  # jq
  # ripgrep
  # tree
  # tmux
  # unrar
  # unzip
  # zsh-powerlevel10k

  # # Python packages
  # python39
  # python39Packages.virtualenv # globally install virtualenv
  
]
