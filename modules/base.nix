# Core settings every host and every home gets.
{ config, ... }:
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      imports = with config.flake.modules.nixos; [
        nix-settings
        locale
        networking
      ];

      environment.systemPackages = with pkgs; [
        helix
        wget
      ];

      system.stateVersion = "26.05"; # Did you read the comment?
    };

  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      imports = [ config.flake.modules.homeManager.nix-settings ];

      home.stateVersion = "26.05";

      home.packages = with pkgs; [
        tree
      ];
    };
}
