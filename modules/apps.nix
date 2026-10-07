# General purpose desktop applications.
{ ... }:
{
  flake.modules.nixos.apps =
    { ... }:
    {
      services.flatpak.enable = true;
      programs.coolercontrol.enable = true;
    };

  flake.modules.homeManager.apps =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        librewolf
        ncdu
        ente-auth
        en-croissant
      ];
    };
}
