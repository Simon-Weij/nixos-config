{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.concord-tui
  ];
}
