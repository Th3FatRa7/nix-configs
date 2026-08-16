{pkgs, ...}: {
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    allowedHosts = "localhost:8082,homelab:8082";
    settings = {
      title = "Operator Homelab";
      theme = "dark";
      color = "slate";
      layout = "columns";
      headerStyle = "clean";
    };
    services = [
      {
        "Infrastructure" = [
          {
            "Syncthing" = {
              href = "http://homelab:8384";
              description = "File synchronization";
              icon = "syncthing.png";
            };
          }
          {
            "Forgejo" = {
              href = "http://homelab:3000";
              description = "Git hosting";
              icon = "forgejo.png";
            };
          }
        ];
      }
    ];
  };

  services.syncthing = {
    enable = true;
    user = "operator";
    dataDir = "/srv/syncthing";
    configDir = "/var/lib/syncthing";
    openDefaultPorts = false;
  };

  services.forgejo = {
    enable = true;
    stateDir = "/var/lib/forgejo";
    database.type = "sqlite3";
    settings = {
      server = {
        HTTP_ADDR = "0.0.0.0";
        HTTP_PORT = 3000;
        DOMAIN = "homelab";
        ROOT_URL = "http://homelab:3000/";
      };
      service.DISABLE_REGISTRATION = true;
      security.INSTALL_LOCK = true;
    };
  };

  systemd.tmpfiles.rules = [
    "d /srv/syncthing 0750 operator users -"
  ];

  environment.systemPackages = with pkgs; [
    smartmontools
    lm_sensors
  ];
}
