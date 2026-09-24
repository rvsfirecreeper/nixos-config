# Core settings every host and every home gets.
{ ... }:
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfree = true;

      # Configure network connections interactively with nmcli or nmtui.
      networking.networkmanager.enable = true;

      time.timeZone = "America/New_York";
      i18n.defaultLocale = "en_US.UTF-8";

      services.openssh.enable = true;

      environment.systemPackages = with pkgs; [
        helix
        wget
      ];

      system.stateVersion = "26.05"; # Did you read the comment?
    };

  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.stateVersion = "26.05";
      nixpkgs.config.allowUnfree = true;

      home.packages = with pkgs; [
        tree
      ];
    };
}
