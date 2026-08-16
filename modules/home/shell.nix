{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/Projects/nix-configs#$(hostname)";
    };
    initContent = ''
      eval "$(zoxide init zsh)"
      fastfetch
    '';
  };
  home.packages = with pkgs; [eza fastfetch fzf zoxide btop fd bat];
}
