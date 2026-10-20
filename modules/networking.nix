# Network connectivity and remote access.
let
  # Quad9, with the TLS server name appended for DNS-over-TLS validation.
  quad9 = [
    "9.9.9.9#dns.quad9.net"
    "149.112.112.112#dns.quad9.net"
    "2620:fe::fe#dns.quad9.net"
    "2620:fe::9#dns.quad9.net"
  ];
in
{
  flake.modules.nixos.networking =
    { lib, ... }:
    {
      # Configure network connections interactively with nmcli or nmtui.
      networking.networkmanager.enable = true;
      networking.stevenblack = {
        enable = true;
        block = [
          "porn"
          "gambling"
          "social"
          "fakenews"
        ];
      };

      # Resolve everything through Quad9 over DNS-over-TLS. NetworkManager
      # must not hand the router's DHCP DNS servers to resolved: they don't
      # speak DNS-over-TLS, so lookups routed to them would fail.
      networking.nameservers = quad9;
      networking.networkmanager.dns = lib.mkForce "none";
      networking.networkmanager.settings.main.systemd-resolved = false;
      services.resolved = {
        enable = true;
        settings.Resolve = {
          DNSOverTLS = "true";
          Domains = [ "~." ];
          FallbackDNS = quad9;
        };
      };

      services.openssh = {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
        };
      };

      # Authenticate once with `sudo tailscale up`.
      services.tailscale = {
        enable = true;
        openFirewall = true;
        useRoutingFeatures = "client";
      };
      networking.firewall.trustedInterfaces = [ "tailscale0" ];
    };
}
