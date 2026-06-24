{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pandora-launcher
  ];
}
