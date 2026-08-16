{ inputs, ... }:{
  imports = [
    inputs.wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;
    defaultUser = "operator";
    docker-desktop.enable = true;
    useWindowsDriver = true;
  };

  programs.nix-ld.enable = true;
}