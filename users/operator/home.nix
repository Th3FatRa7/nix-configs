{
  imports = [
    ../../modules/home/common
    ../../modules/home/agent
    ../../modules/home/apps
    ../../modules/home/desktop
    ../../modules/home/dev
  ];

  home = {
    username = "operator";
    homeDirectory = "/home/operator";
    stateVersion = "26.11";
  };

  programs.home-manager.enable = true;
}
