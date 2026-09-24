# General purpose desktop applications.
{ ... }:
{
  flake.modules.nixos.apps =
    { ... }:
    {
      services.flatpak.enable = true;
    };

  flake.modules.homeManager.apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        librewolf
        obsidian
        en-croissant
      ];
    };
}
