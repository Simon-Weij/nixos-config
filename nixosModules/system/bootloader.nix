{...}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
        #        configurationLimit = 5;
      };
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      linux-firmware = prev.linux-firmware.overrideAttrs (_: {
        version = "20260810";
        src = final.fetchFromGitLab {
          owner = "kernel-firmware";
          repo = "linux-firmware";
          tag = "20260810";
          hash = "sha256-P/fPpqaatp8Z2GV+I/OChiWGn6AhV+8w1RMFuX/LqHc=";
        };
      });
    })
  ];
}
