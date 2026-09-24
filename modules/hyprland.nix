# Hyprland session and the services it relies on.
{ ... }:
{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      programs.hyprland.enable = true;
      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;

      environment.systemPackages = [ pkgs.gnome-keyring ];
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        wl-clipboard
      ];
    };
}
