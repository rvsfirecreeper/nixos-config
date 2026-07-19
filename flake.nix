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
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      dots,
      ...
    }:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.users.ragef = {
                imports = [
                  dots.homeManagerModules.default
                  ./home.nix
                ];
              };
              home-manager.backupFileExtension = "backup";
            }
            ./configuration.nix
            ./hosts/desktop/hardware-configuration.nix
          ];
        };
      };
    };
}
