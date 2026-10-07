# Core settings every host and every home gets.
{ lib, ... }:
let
  # Only these nonfree packages are permitted; all other unfree is rejected.
  allowedUnfree = [
    "steam"
    "steam-unwrapped"
    "steam-run"
    "claude-code"
  ];
  unfreePredicate = pkg: builtins.elem (lib.getName pkg) allowedUnfree;
in
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfreePredicate = unfreePredicate;

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
      nixpkgs.config.allowUnfreePredicate = unfreePredicate;

      home.packages = with pkgs; [
        tree
      ];
    };
}
