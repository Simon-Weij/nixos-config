{pkgs, ...}: {
    systemd.services."NetworkManager-wait-online".enable = false;

    systemd.services.docker.enable = false;

    systemd.sockets.docker.enable = true;

}
