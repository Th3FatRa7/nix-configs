{ config, ... }:
{
  luaLoader.enable = true;

  performance = {
    # Some plugins ship documentation files with the same names. Keeping
    # plugins separate avoids buildEnv path collisions during packing.
    combinePlugins = {
      enable = true;
      # Keep the known-conflicting plugins outside the combined pack.
      standalonePlugins = [
        config.plugins.oil.package
        config.plugins.conform-nvim.package
        config.colorschemes.nord.package
      ];
    };
    byteCompileLua = {
      enable = true;
      plugins = true;
    };
  };
}
