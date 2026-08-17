{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.disko
    ../../modules/nixos/disko.nix
    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/desktop.nix
  ];
}
