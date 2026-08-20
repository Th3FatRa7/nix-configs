{
  plugins.lazygit.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>LazyGit<cr>";
      options.desc = "Open LazyGit";
    }
  ];
}
