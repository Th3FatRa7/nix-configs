{
  description = "Operator's modular NixOS and Home Manager configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    flake-parts,
    disko,
    wsl,
    noctalia,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };

      flake = let
        system = "x86_64-linux";
        overlays = [
          inputs.nur.overlays.default
          (import ./overlays/tmux-tilish.nix)
        ];
        mkHost = {
          hostname,
          modules,
        }:
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {inherit inputs overlays;};
            modules =
              modules
              ++ [
                {
                  networking.hostName = hostname;
                  nixpkgs = {
                    inherit overlays;
                    config.allowUnfree = true;
                  };
                }
              ];
          };
      in {
        homeConfigurations.operator = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system overlays;
            config.allowUnfree = true;
          };
          extraSpecialArgs = {inherit inputs;};
          modules = [./users/operator/home.nix];
        };

        nixosConfigurations = {
          wsl = mkHost {
            hostname = "wsl";
            modules = [./hosts/wsl];
          };
          katana = mkHost {
            hostname = "katana";
            modules = [./hosts/katana];
          };
          laptop = mkHost {
            hostname = "laptop";
            modules = [./hosts/laptop];
          };
          homelab = mkHost {
            hostname = "homelab";
            modules = [./hosts/homelab];
          };
        };
      };
    };
}
