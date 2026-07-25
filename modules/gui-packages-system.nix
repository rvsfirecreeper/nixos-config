{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    ly
  ];
}
