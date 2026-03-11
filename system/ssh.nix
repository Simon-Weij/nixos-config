{flakeConfig, ...}: {
  users.users."${flakeConfig.username}".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEL/tvH1DnT4yIeyX9QgxOkmQPWVdE9Zqvya4DNH5XRV"
  ];
  nix.settings.trusted-public-keys = [
    "sapphire-1:ush4CVFoU9aqM1E+sQFlrZl8aVt/59mM="
  ];
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [22];
  nix.settings.require-sigs = false;
}
