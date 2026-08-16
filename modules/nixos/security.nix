{lib, ...}: {
  security.sudo.wheelNeedsPassword = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.timesyncd.enable = lib.mkDefault true; # TODO: Remove this once I've restructured the repo
  services.fail2ban.enable = true;
  systemd.coredump.enable = false;
}
