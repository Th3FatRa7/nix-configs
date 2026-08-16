{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
    fuzzel
    grim
    mako
    networkmanagerapplet
    pavucontrol
    playerctl
    slurp
    swaylock
    swww
    waybar
    wl-clipboard
  ];

  xdg.configFile."niri/config.kdl".text = ''
    input {
      keyboard { xkb { layout "us" } }
      focus-follows-mouse
    }

    layout {
      gaps 12
      center-focused-column "never"
      default-column-width { proportion 0.5; }
    }

    prefer-no-csd
    screenshot-path "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"
    spawn-at-startup "waybar"
    spawn-at-startup "mako"
    spawn-at-startup "swww-daemon"

    binds {
      Mod+Return { spawn "kitty"; }
      Mod+D { spawn "fuzzel"; }
      Mod+Q { close-window; }
      Mod+Shift+E { quit; }
      Mod+Ctrl+L { spawn "swaylock" "-f"; }
      Print { screenshot; }
      Mod+H { focus-column-left; }
      Mod+J { focus-window-or-workspace-down; }
      Mod+K { focus-window-or-workspace-up; }
      Mod+L { focus-column-right; }
      Mod+Shift+H { move-column-left; }
      Mod+Shift+L { move-column-right; }
      Mod+F { maximize-column; }
      Mod+Shift+F { fullscreen-window; }
      Mod+WheelScrollDown { focus-workspace-down; }
      Mod+WheelScrollUp { focus-workspace-up; }
      XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
      XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
      XF86AudioMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
    }
  '';

  xdg.configFile."waybar/config.jsonc".text = ''
    {
      "layer": "top", "position": "top", "height": 34,
      "modules-left": ["niri/workspaces"],
      "modules-center": ["clock"],
      "modules-right": ["network", "pulseaudio", "battery", "tray"],
      "clock": {"format": "󰥔  {:%a %b %d  %H:%M}"},
      "battery": {"format": "󰁹  {capacity}%"},
      "network": {"format-wifi": "󰖩  {essid}", "format-ethernet": "󰈀  wired", "format-disconnected": "󰖪  offline"},
      "pulseaudio": {"format": "󰕾  {volume}%", "format-muted": "󰖁  muted"},
      "tray": {"spacing": 8}
    }
  '';

  xdg.configFile."waybar/style.css".text = ''
    * { font-family: "Inter", sans-serif; font-size: 13px; }
    window#waybar { background: rgba(20, 18, 32, 0.72); color: #f5efff; border: 1px solid rgba(255,255,255,.12); border-radius: 12px; }
    #workspaces, #clock, #network, #pulseaudio, #battery, #tray { padding: 0 10px; margin: 4px 3px; background: rgba(255,255,255,.07); border-radius: 9px; }
  '';

  xdg.configFile."mako/config".text = ''
    font=Inter 11
    background-color=#201b31dd
    text-color=#f5efff
    border-color=#c9a7ff
    border-radius=12
    default-timeout=5000
    margin=12
    padding=12
  '';
}
