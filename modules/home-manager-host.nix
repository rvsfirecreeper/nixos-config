# Home Manager as a NixOS module, with the shared dotfiles applied to the user.
{ inputs, ... }:
{
  flake.modules.nixos.home-manager-host = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager.backupFileExtension = "backup";
    home-manager.users.ragef.imports = [ inputs.dots.homeManagerModules.default ];
  };
}
