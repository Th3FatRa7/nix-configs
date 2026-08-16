{
  plugins.persisted = {
    enable = true;
    enableTelescope = true;
    callSetup = false;
  };

  extraConfigLua = ''
    require("persisted").setup({
      autoload = true,
      use_git_branch = true,
    })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>qs";
      action = "<cmd>Persisted save<cr>";
      options.desc = "Save session";
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>Persisted load<cr>";
      options.desc = "Load session";
    }
    {
      mode = "n";
      key = "<leader>qf";
      action = "<cmd>Telescope persisted<cr>";
      options.desc = "Find session";
    }
    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>Persisted delete<cr>";
      options.desc = "Delete session";
    }
  ];
}
