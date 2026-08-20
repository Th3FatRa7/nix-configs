{
  programs.kitty = {
    enable = true;
    themeFile = "Carbonfox";
    font.name = "GeistMonoNerdFont";
    font.size = 12;

    settings = {
      background_opacity = 0.85;

      cursor_blink_interval = "0.5 ease-in-out";
      cursor_stop_blinking_after = 0;
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.2";
      cursor_trail_start_threshold = 1;

      scrollbar = "never";
      scrollbar_interactive = false;

      sync_to_monitor = true;

      enable_audio_bell = false;

      hide_window_decorations = true;

      confirm_os_window_close = 0;
    };
  };
}
