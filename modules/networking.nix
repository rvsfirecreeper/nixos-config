# Network connectivity and remote access.
{
  flake.modules.nixos.networking = {
    # Configure network connections interactively with nmcli or nmtui.
    networking.networkmanager.enable = true;

    services.openssh.enable = true;
  };
}
