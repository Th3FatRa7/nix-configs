{ pkgs, ... }: {
  programs.librewolf = {
    enable = true;
    profiles.default = {
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          vimium
          darkreader
          proton-pass
        ];
      };
    };
  };
}
