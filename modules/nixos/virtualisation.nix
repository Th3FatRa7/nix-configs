{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        runAsRoot = false;
        swtpm.enable = true;
      };
    };

    docker = {
      enable = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };

      daemon.settings = {
        log-driver = "local";
        log-opts = {
          max-size = "10m";
          max-file = "3";
        };
        live-restore = true;
      };
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  programs.virt-manager.enable = true;

  users.users.operator.extraGroups = ["libvirtd" "kvm" "docker"];
}
