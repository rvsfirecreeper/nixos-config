# Host definition: picks features and builds the system.
{ inputs, config, ... }:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [ config.flake.modules.nixos.desktop-host ];
  };

  flake.modules.nixos.desktop-host = {
    imports =
      (with config.flake.modules.nixos; [
        base
        boot-uefi
        home-manager-host
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

    home-manager.users.ragef.imports = with config.flake.modules.homeManager; [
      base
      hyprland
      apps
      dev
      gaming
      security-keys
    ];
  };
}
