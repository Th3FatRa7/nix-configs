{
  imports = [
    ./telescope.nix
    ./harpoon.nix
    ./oil.nix
    ./comment.nix
    ./conform.nix
    ./persisted.nix
    ./floaterm.nix
    ./bufferline.nix
    ./treesitter.nix
    ./lazygit.nix
    ./indentscope.nix
  ];

  plugins = {
    orgmode.enable = true;
    lualine.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    render-markdown.enable = true;
    nvim-autopairs.enable = true;
  };
}
