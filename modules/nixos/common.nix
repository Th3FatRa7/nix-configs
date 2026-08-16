{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  system.stateVersion = "26.11";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    trusted-users = ["root" "operator"];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  boot.tmp.cleanOnBoot = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.fstrim.enable = true;

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

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
    users.operator = import ../../users/operator/home.nix;
    extraSpecialArgs = {inherit inputs pkgs;};
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    jq
    pciutils
    ripgrep
    usbutils
    wget
  ];
}
