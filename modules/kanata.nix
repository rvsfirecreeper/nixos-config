# Kanata needs access to uinput. This module also adds the user to the
# uinput group, so the group wiring lives with the feature that needs it.
{ ... }:
{
  flake.modules.nixos.kanata =
    { pkgs, ... }:
    {
      boot.kernelModules = [ "uinput" ];

      services.udev.extraRules = ''
        KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
      '';

      users.groups.uinput = { };
      users.users.ragef.extraGroups = [ "uinput" ];

      environment.systemPackages = [ pkgs.kanata ];
    };
}
