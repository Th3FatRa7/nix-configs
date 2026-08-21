{pkgs, ...}: {
  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "hyprland";

  hardware.graphics.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
  ];
}
