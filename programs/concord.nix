{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    concord-tui
    mpv
  ];
}
