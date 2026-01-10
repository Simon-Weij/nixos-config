{pkgs, ...}: {
  systemd.user.services.gpu-screen-recorder = {
    description = "GPU Screen Recorder UI";
    wantedBy = ["graphical-session.target"];
    after = ["graphical-session.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.flatpak}/bin/flatpak run com.dec05eba.gpu_screen_recorder gsr-ui";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
