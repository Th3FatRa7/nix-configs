final: prev: {
  tmuxPlugins =
    prev.tmuxPlugins
    // {
      tilish = prev.tmuxPlugins.tilish.overrideAttrs (old: {
        version = "my-test";

        src = prev.fetchFromGitHub {
          owner = "jabirali";
          repo = "tmux-tilish";
          rev = "fb9e418a34f13dbe712815e9ab42692b004bc4aa";
          hash = "sha256-Ri6x5RIozyUh+FhmW1Z1QEU9CL+OGqMDolbqaLO+Ggg=";
        };
      });
    };
}
