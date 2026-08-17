{ pkgs, ... }: {

  home.packages = with pkgs; [
    lsd
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = [
      "no-runtime-versions"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    history = {
      save = 100000;
      size = 100000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
    };
  };

  home.shellAliases = {
    # FS and Terminal
    c = "clear";
    x = "exit";
    l = "lsd --group-directories-first --color=always";
    la = "l -alg";
    ll = "l -lg";
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    pd = "cd - > /dev/null";
    tree = "lsd --tree";

    # Tools
    e = "$EDITOR";
    g = "git";

    # Nixos
    rebuild = "sudo nixos-rebuild switch --flake";
  };
}
