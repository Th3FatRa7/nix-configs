{inputs, ...}: {
  nix.settings = {
    extra-substituters = ["https://noctalia.cachix.org"];
    extra-trusted-public-keys = ["noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="];
  };

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      bar.default = {
        position = "bottom";
        radius = 8; # Follows hyprland
        start = ["wallhaven" "workspaces"];
      };

      shell.font_family = "GeistMono NF";

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";
        pure_black_dark = true;
      };

      location.auto_locate = true;

      plugins.enabled = ["noctalia/wallhaven"];

      widget.wallhaven = {
        type = "noctalia/wallhaven:wallhaven";
        enabled = true;
      };
    };
  };
}
