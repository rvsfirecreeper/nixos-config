# Games and game tooling.
{ ... }:
{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        steam
        jdk25
        lutris
        prismlauncher
        owmods-gui
      ];
    };
}
