{flakeConfig, ...}: {
  imports = [
    ./niri.nix
    ./noctalia/noctalia.nix
    {
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      networking.firewall.enable = true;
      services.gnome.gnome-keyring.enable = true;
      security.pam.services.login.enableGnomeKeyring = true;
      services.flatpak.enable = true;
      services.keyd = {
        enable = true;
        keyboards.default = {
          ids = ["*"];
          settings.main.capslock = "f12";
        };
      };
      networking.networkmanager.enable = true;
      networking.hostName = flakeConfig.networking.hostName;
      hjem = {
        clobberByDefault = true;
        users."${flakeConfig.username}" = {
          user = "${flakeConfig.username}";
          directory = "/home/${flakeConfig.username}";
          files = {
            ".config/user-dirs.dirs" = {
              text = ''
                XDG_DOWNLOAD_DIR="$HOME/Downloads"
                XDG_DOCUMENTS_DIR="$HOME/Documents"
                XDG_PICTURES_DIR="$HOME/Pictures"
                XDG_VIDEOS_DIR="$HOME/Videos"
              '';
              type = "copy";
              permissions = "0644";
            };
          };
        };
      };
    }
  ];
}
