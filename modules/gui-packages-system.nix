{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    ly
    kanata
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    nerd-fonts.jetbrains-mono
  ];
}
