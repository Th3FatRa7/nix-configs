{config, ...}: {
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;

    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      markdown
      lua
      nix
      vim
      vimdoc
      json
      yaml
      python
    ];
  };
}
