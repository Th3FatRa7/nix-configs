# Inspirations:
# https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua
# https://git.helcel.net/sora/nixconfig/src/branch/main/modules/home/wayland/hyprland/config.nix
{lib, ...}: let
  default = {
    terminal = "kitty";
    browser = "librewolf";
    launcher = "noctalia msg panel-toggle launcher";
  };

  lua = lib.generators.mkLuaInline;

  bind = keys: dispatcher: {_args = [keys dispatcher];};

  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    close = lua "hl.dsp.window.close()";
    float = lua ''hl.dsp.window.float({ action = "toggle" })'';
    fullscreen = lua "hl.dsp.window.fullscreen()";
    focus = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    move = dir: lua ''hl.dsp.window.move({ direction = "${dir}" })'';
    focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}", follow = false})'';
  };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "lua";

    settings = {
      # ---- MONITORS ----
      monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      };

      # ---- AUTOSTART ----
      on._args = [
        "hyprland.start"
        (lua ''function() hl.exec_cmd("noctalia") end'')
      ];

      config = {
        # ---- LOOK AND FEEL ----
        general = {
          gaps_in = 2;
          gaps_out = 10;

          border_size = 1;

          col = {
            active_border = "rgba(ffffffff)";
            inactive_border = "rgba(595959aa)";
          };
        };

        decoration = {
          rounding = 8;
          rounding_power = 2;

          blur = {
            enabled = true;
            size = 5;
            passes = 1;
            new_optimizations = true;
          };
        };

        # ---- MISC ----
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        # ---- INPUT ----
        input = {
          kb_layout = "us";
          kb_options = "ctrl:nocaps";
        };
      };

      # ---- KEYBINDINGS ----
      bind = [
        # programs
        (bind "SUPER + B" (dsp.exec default.browser))
        (bind "SUPER + RETURN" (dsp.exec default.terminal))
        (bind "SUPER + T" (dsp.exec default.terminal))
        (bind "SUPER + SPACE" (dsp.exec default.launcher))

        # move focus (vim like)
        (bind "SUPER + H" (dsp.focus "left"))
        (bind "SUPER + J" (dsp.focus "down"))
        (bind "SUPER + K" (dsp.focus "up"))
        (bind "SUPER + L" (dsp.focus "right"))

        (bind "SUPER + SHIFT + H" (dsp.move "left"))
        (bind "SUPER + SHIFT + J" (dsp.move "down"))
        (bind "SUPER + SHIFT + K" (dsp.move "up"))
        (bind "SUPER + SHIFT + L" (dsp.move "right"))

        # window action
        (bind "SUPER + Q" (dsp.close))
        (bind "SUPER + F" (dsp.fullscreen))
        (bind "SUPER + V" (dsp.float))

        # media
        (bind "XF86AudioPlay" (dsp.exec "noctalia msg media toggle"))
        (bind "XF86AudioPrev" (dsp.exec "noctalia msg media previous"))
        (bind "XF86AudioNext" (dsp.exec "noctalia msg media next"))

        # volume
        (bind "XF86AudioRaiseVolume" (dsp.exec "noctalia msg volume-up"))
        (bind "XF86AudioLowerVolume" (dsp.exec "noctalia msg volume-down"))
        (bind "XF86AudioMute" (dsp.exec "noctalia msg volume-mute"))

        # brightness
        (bind "XF86MonBrightnessUp" (dsp.exec "noctalia msg brightness-up"))
        (bind "XF86MonBrightnessDown" (dsp.exec "noctalia msg brightness-down"))

        # lock
        (bind "CTRL + ALT + L" (dsp.exec "noctalia msg session lock"))
      ];
    };

    # Loop that creates mapping for workspaces
    extraConfig = ''
      for i = 1, 10 do
        local key = i % 10
        hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
      end
    '';
  };
}
