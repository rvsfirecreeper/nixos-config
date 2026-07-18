{
  description = "RajLab NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dots = {
      url = "github:rvsfirecreeper/dots";
    };
    personal-config = {
      url = "github:rvsfirecreeper/nixos-config";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      dots,
      personal-config,
      ...
    }:
    {
      nixosConfigurations = {
        pcnix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.ragef = {
                imports = [
                  dots.homeManagerModules.default
                  (personal-config + "/home.nix")
                ];
              };
              home-manager.backupFileExtension = "backup";
            }
            ./configuration.nix
            ./hardware-configuration.nix
          ];
        };
      };
    };
}
