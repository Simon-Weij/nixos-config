{ ... }:
{
  security.apparmor.enable = true;
  networking.firewall.enable = true;
  nix.settings.sandbox = true;
}
