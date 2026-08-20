# Inspired by the structure of this example config https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua
{lib, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "lua";

    settings = let
      mkLua = lib.generators.mkLuaInline;
    in {
      # ---- MONITORS ----
      monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      };

      # ---- PROGRAMS ----
      terminal._var = "kitty";
      browser._var = "librewolf";
      launcher._var = "noctalia msg panel-toggle launcher";

      # ---- AUTOSTART ----
      on._args = [
        "hyprland.start"
        (mkLua "function()\n  hl.exec_cmd(\"noctalia\")\nend")
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
            size = 2;
            passes = 1;
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
        };
      };

      # ---- KEYBINDINGS ----
      mainMod._var = "SUPER";

      bind = let
        mkBind = keys: dispatcher: {
          _args = [
            (mkLua keys)
            (mkLua dispatcher)
          ];
        };
      in [
        # programs
        (mkBind "mainMod .. \" + b\"" "hl.dsp.exec_cmd(browser)")
        (mkBind "mainMod .. \" + Return\"" "hl.dsp.exec_cmd(terminal)")
        (mkBind "mainMod .. \" + t\"" "hl.dsp.exec_cmd(terminal)") # Glove80 has Mod + Ret on the same thumb
        (mkBind "mainMod .. \" + d\"" "hl.dsp.exec_cmd(launcher)")

        # move focus (vim like)
        (mkBind "mainMod .. \" + h\"" "hl.dsp.focus({ direction = \"left\" })")
        (mkBind "mainMod .. \" + j\"" "hl.dsp.focus({ direction = \"down\" })")
        (mkBind "mainMod .. \" + k\"" "hl.dsp.focus({ direction = \"up\" })")
        (mkBind "mainMod .. \" + l\"" "hl.dsp.focus({ direction = \"right\" })")

        # window action
        (mkBind "mainMod .. \" + q\"" "hl.dsp.window.close()")
        (mkBind "mainMod .. \" + f\"" "hl.dsp.window.fullscreen({ mode = \"fullscreen\", action = \"toggle\" })")
        (mkBind "mainMod .. \" + v\"" "hl.dsp.window.float({ action = \"toggle\" })")
      ];
    };

    # Loop that creates mapping for workspaces
    extraConfig = ''
      for i = 1, 10 do
        local key = i % 10
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
      end
    '';
  };
}
