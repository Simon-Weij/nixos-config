{
  pkgs,
  flakeConfig,
  inputs,
  ...
}:
let
  username = flakeConfig.username;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  users.users."${username}" = {
    packages = with pkgs; [
      ungoogled-chromium
      floorp-bin

      heroic
      vesktop
      steam

      teams-for-linux
      vscode
      github-desktop

      distrobox
      nh
      git

      nautilus

      nixfmt-rfc-style

      nix-init

      geary

      winboat

      nodejs
      nodePackages."@angular/cli"

      gnome-console

      hoppscotch

      alejandra

      nixd

      go
      gopls
      cobra-cli
    ];
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "org.prismlauncher.PrismLauncher"
      "org.gnome.Boxes"
      "in.cinny.Cinny"
    ];
  };

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
  };

  virtualisation.docker.enable = true;
}
