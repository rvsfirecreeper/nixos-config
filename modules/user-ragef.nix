# The primary user account.
{ ... }:
{
  flake.modules.nixos.user-ragef =
    { pkgs, ... }:
    {
      programs.fish.enable = true;

      users.users.ragef = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [
          "wheel" # sudo
          "input"
          "networkmanager"
        ];
      };
    };
}
