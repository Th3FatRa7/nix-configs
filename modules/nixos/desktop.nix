{pkgs, ...}: {
  programs.niri.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "cinnamon";

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
