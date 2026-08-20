{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.settings.trusted-users = ["operator"];

  users.users.operator = {
    isNormalUser = true;
    uid = 1000;
    description = "Operator";
    extraGroups = ["wheel" "networkmanager" "video" "audio"];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.operator = ./home.nix;
    extraSpecialArgs = {inherit inputs pkgs;};
  };
}
