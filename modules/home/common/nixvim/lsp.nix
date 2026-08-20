{
  plugins.lspconfig.enable = true;

  diagnostic.settings.virtual_text = true;

  extraConfigLua = ''
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
      },
    })
  '';

  lsp = {
    inlayHints.enable = true;
    servers = {
      nil_ls.enable = true;
    };
  };
}
