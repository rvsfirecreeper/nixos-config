# Graphics, audio, fonts and login manager.
{ ... }:
{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };

      services.displayManager.ly.enable = true;

      fonts.packages = with pkgs; [
        noto-fonts
        nerd-fonts.jetbrains-mono
      ];
    };
}
