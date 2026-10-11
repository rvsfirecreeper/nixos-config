# Games and game tooling.
{ ... }:
{
  flake.modules.homeManager.gaming =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        steam
        winetricks
        jdk25 # needed for block game
        lutris
        prismlauncher
        owmods-gui
      ];
      home.file.".local/share/Steam".source = config.lib.file.mkOutOfStoreSymlink /games/Steam;
    };
}
