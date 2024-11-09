{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [
  # macOS specific packages
  dockutil
<<<<<<< HEAD
  mas
=======
  # vscode    # Instead of visual-studio-code cask
  # slack     # Instead of slack cask
  spotify   # Instead of spotify cask
  # postman   # Instead of postman cask
  # iterm2    # Instead of iterm2 cask
>>>>>>> new
]
