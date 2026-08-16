{
  imports = [
    ../../modules/nixos/wsl.nix
    ../../modules/nixos/common.nix
  ];
  services.timesyncd.enable = false; # It was conflicting with the wsl module. Should I restructure the repo or keep this line ?
}