# Games and game tooling.
{ ... }:
{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        steam
        winetricks
        jdk25
        lutris
        prismlauncher
        owmods-gui
      ];
    };
}
