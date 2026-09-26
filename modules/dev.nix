# Programming tools and editors.
{ ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        rustup
        rustrover
        gcc
        godot
        zed-editor
        nil
      ];
    };
}
