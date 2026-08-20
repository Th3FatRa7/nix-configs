# Heavily inspired by GaetanLepage's config
{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    imports = [
      ./plugins
      ./completion.nix
      ./keymappings.nix
      ./options.nix
      ./performance.nix
      ./colorschemes.nix
      ./lsp.nix
    ];
  };
}
