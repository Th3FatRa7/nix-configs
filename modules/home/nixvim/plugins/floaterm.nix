{
  plugins.floaterm = {
    enable = true;
    settings = {
      title = "";
      width = 0.9;
      height = 0.9;
    };
  };

  keymaps = [
    {
      mode = ["n" "t"];
      key = "<C-t>";
      action = "<cmd>FloatermToggle<cr>";
      options.desc = "Toggle floating terminal";
    }
  ];
}
