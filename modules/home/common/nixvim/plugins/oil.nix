{
  plugins.oil = {
    enable = true;
    settings.default_file_explorer = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil<cr>";
      options.desc = "Open Oil file explorer";
    }
  ];
}
