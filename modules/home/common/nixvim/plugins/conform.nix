{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };

      formatters_by_ft = {
        nix = ["alejandra"];
        lua = ["stylua"];
      };

      formatters = {
        alejandra.command = lib.getExe pkgs.alejandra;
        stylua.command = lib.getExe pkgs.stylua;
      };
    };
  };
}
