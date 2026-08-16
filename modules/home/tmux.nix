{
  pkgs,
  config,
  ...
}: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    escapeTime = 0;
    terminal = "screen-256color";
    disableConfirmationPrompt = true;
    extraConfig = ''
      # Persist and restore tmux sessions automatically.
      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '15'
    '';
    plugins = with pkgs.tmuxPlugins; [
      # Resurrect must be loaded before Continuum.
      resurrect
      continuum
      {
        plugin = tilish;
        extraConfig = ''
          set -g @tilish-default 'main-vertical'
          set -g @tilish-remap 'Q=q'
          set -g @tilish-project '${config.home.homeDirectory}/Projects'
        '';
      }
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
    ];
  };
}
