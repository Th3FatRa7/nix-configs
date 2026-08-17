{pkgs, ...}: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.timeout = 0;

    initrd.verbose = false;
    initrd.kernelModules = ["i915"];

    consoleLogLevel = 3;

    kernelParams = [
      "quiet"
      "splash"

      "rd.udev.log_level=3"
      "rd.systemd.show_status=false"
      "systemd.show_status=false"
    ];

    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        adi1090x-plymouth-themes
      ];
      theme = "hexagon_dots_alt";
    };
  };
}
