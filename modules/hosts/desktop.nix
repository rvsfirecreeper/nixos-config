# Host definition: picks features and builds the system.
{ inputs, config, ... }:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      inputs.home-manager.nixosModules.home-manager
      config.flake.modules.nixos.desktop-host
    ];
  };

  flake.modules.nixos.desktop-host = {
    imports =
      (with config.flake.modules.nixos; [
        base
        desktop
        hyprland
        apps
        security-keys
        bluetooth
        linker-fixes
        kanata
        user-ragef
      ])
      ++ [ ./desktop/_hardware-configuration.nix ];

    networking.hostName = "heres-my-nix-flake";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    home-manager.backupFileExtension = "backup";
    home-manager.users.ragef.imports =
      [ inputs.dots.homeManagerModules.default ]
      ++ (with config.flake.modules.homeManager; [
        base
        hyprland
        apps
        dev
        gaming
        security-keys
      ]);
  };
}
