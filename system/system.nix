{
  flakeConfig,
  ...
}:
let
  username = flakeConfig.username;
in
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = flakeConfig.networking.hostName;
  networking.firewall.enable = true;

  nix.settings = {
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    sandbox = true;
  };

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    hashedPassword = "REMOVED";
  };

  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.gnome.core-apps.enable = false;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  security = {
    rtkit.enable = true;
    apparmor.enable = true;
  };

  programs.bash.completion.enable = true;

  nixpkgs.config.allowUnfree = true;
  hardware.bluetooth.enable = true;

  system.stateVersion = flakeConfig.stateVersion;

  documentation.nixos.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.nix-ld.enable = true;
}
