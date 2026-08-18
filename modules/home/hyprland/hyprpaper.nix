{config, ...}: {
  home.file.".wallpapers".source = ./wallpapers;

  services.hyprpaper = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "";
          fit_mode = "cover";
          path = "${config.home.homeDirectory}/.wallpapers/nix-wallpaper-binary-black_8k.png";
        }
      ];
    };
  };
}
