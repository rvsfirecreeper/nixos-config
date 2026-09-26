# Programming tools and editors.
{ ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        rustup
        gcc
        godot
        zed-editor
        nil
      ];
    };
}
