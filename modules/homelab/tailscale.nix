{
  # Enable Tailscale in a declarative way so the daemon is always managed by NixOS.
  services.tailscale.enable = true;

  # Open the firewall for Tailscale coordination and peer traffic on this host.
  services.tailscale.openFirewall = true;

  # Keep this host on the stable Tailscale package from nixpkgs unless a different channel is required.
  # Add auth or routing options here later when the homelab network design is finalized.
}
