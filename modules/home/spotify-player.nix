{
  programs.spotify-player = {
    enable = true;
    settings = {
      enable_notify = false;
      liked_icon = "";
      explicit_icon = "󰬌";
      border_type = "Thick";
      enable_mouse_scroll_volume = false;
    };
  };

  home.shellAliases = {
    music = "spotify_player";
  };
}
