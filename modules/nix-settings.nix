# Nix daemon settings and the unfree-package allowlist.
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
  flake.modules.nixos.nix-settings = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nixpkgs.config.allowUnfreePredicate = unfreePredicate;
  };

  flake.modules.homeManager.nix-settings = {
    nixpkgs.config.allowUnfreePredicate = unfreePredicate;
  };
}
