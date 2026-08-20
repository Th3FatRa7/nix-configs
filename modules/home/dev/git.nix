{
  home.shellAliases = {
    g = "git";
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "th3fatra7";
        email = "142910646+Th3FatRa7@users.noreply.github.com";
      };

      init.defaultBranch = "main";

      fetch.prune = true;
      pull.rebase = true;
      rebase.autoStash = true;
      push.autoSetupRemote = true;
      merge.conflictStyle = "zdiff3";

      alias = {
        st = "status";
        cm = "commit -m";
        l = "log --oneline";
        ll = "log";
        lg = "log --oneline --graph --decorate --all";
        a = "add";
        co = "checkout";
        br = "branch";
        df = "diff";
        rb = "rebase";
        mg = "merge";
        pl = "pull";
        ps = "push";
        unstage = "restore --staged";
      };
    };
  };
}
