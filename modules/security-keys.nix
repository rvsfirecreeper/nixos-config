# GnuPG, smartcards, hardware security keys and password management.
{ ... }:
{
  flake.modules.nixos.security-keys =
    { pkgs, ... }:
    {
      programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-qt;
      };

      environment.systemPackages = with pkgs; [
        gnupg
        pinentry-qt
        libfido2
        pcsclite
        opensc
      ];
    };

  flake.modules.homeManager.security-keys =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        yubikey-manager
        yubikey-personalization
        keepassxc
      ];
    };
}
