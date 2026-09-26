# Programming tools and editors.
{ ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        rustup
        jetbrains.rust-rover
        gcc
        godot
        zed-editor
        nil
      ];
    };
}
