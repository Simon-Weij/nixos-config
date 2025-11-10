{
  pkgs,
  unstable,
  inputs,
  flakeConfig,
  ...
}:
let
  username = flakeConfig.username;
in
{
  users.users."${username}".packages = [
    # system
    unstable.ungoogled-chromium
    unstable.ghostty

    # gaming
    unstable.heroic
    unstable.vesktop

    # office
    unstable.teams-for-linux

    # development
    unstable.vscode

    unstable.github-desktop

    unstable.gh
    unstable.git

    unstable.nil

    unstable.brightnessctl

    unstable.nodePackages."@angular/cli"
    unstable.nodePackages."@nestjs/cli"

    inputs.nvim.packages.${pkgs.stdenv.system}.default
  ];

  virtualisation.docker.enable = true;

  services.flatpak = {
    enable = true;
    packages = [

      {
        appId = "org.vinegarhq.Sober";
        origin = "flathub";
      }
      {
        appId = "org.prismlauncher.PrismLauncher";
        origin = "flathub";
      }
      {
        appId = "org.gnome.Boxes";
        origin = "flathub";
      }
      {
        appId = "in.cinny.Cinny";
        origin = "flathub";
      }
    ];
  };
}
