{
  imports = [
    # Baseline host settings (stateVersion, nix daemon defaults, locale, networking, and core CLI tools).
    ../../modules/nixos/bootloader.nix

    # Host hardening defaults (SSH policy, fail2ban, and related security controls).
    ../../modules/nixos/virtualisation.nix

    # Homelab services (dashboard, Forgejo, Syncthing, and utility packages).
    ../../modules/homelab

    # Tailscale networking is isolated in its own module to keep host concerns separated.
    ../../modules/homelab/tailscale.nix

    # Shared operator account and Home Manager integration.
    ../../users/operator
  ];
}
