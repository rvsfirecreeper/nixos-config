# systemd-boot on a UEFI machine.
{
  flake.modules.nixos.boot-uefi = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
