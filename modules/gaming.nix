# Games and game tooling.
{ ... }:
{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        steam
        prismlauncher
        owmods-gui
      ];
    };
}
