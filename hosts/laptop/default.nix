{inputs, ...}: {
  imports = [
    # Disko
    inputs.disko.nixosModules.disko
    ./disko.nix

    # Nixos
    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/desktop.nix

    # Users
    ../../users/operator
  ];

  hardware.bluetooth.enable = true;
}
