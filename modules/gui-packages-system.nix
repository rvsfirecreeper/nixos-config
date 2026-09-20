{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  networking.networkmanager.enable = true;
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [
    ly
    kanata
    gnome-keyring
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.jetbrains-mono
  ];
}
