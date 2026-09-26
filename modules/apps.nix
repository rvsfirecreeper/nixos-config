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
        ncdu
        obsidian
        ente-auth
        en-croissant
      ];
    };
}
