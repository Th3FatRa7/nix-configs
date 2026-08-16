{ pkgs, ... }: {
  imports = [
    ./copilot.nix
    ./aliases.nix
    ./git.nix
    ./kitty.nix
    ./librewolf.nix
    ./niri.nix
    ./shell.nix
    ./tmux.nix
    ./nixvim
    ./standalone-packages.nix
  ];

  home.username = "operator";
  home.homeDirectory = "/home/operator";
  home.stateVersion = "26.11";
  programs.home-manager.enable = true;
}
