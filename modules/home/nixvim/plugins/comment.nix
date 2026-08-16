{
  plugins.comment.enable = true;

  extraConfigLua = ''
    local comment = require("Comment.api")

    vim.keymap.set("n", "<leader>/", comment.toggle.linewise.current, {
      desc = "Toggle comment",
    })

    vim.keymap.set("x", "<leader>/", "gc", {
      desc = "Toggle comment",
      remap = true,
    })
  '';
}
