{
  pkgs,
  flakeConfig,
  inputs,
  ...
}:
let
  username = flakeConfig.username;
in
{
  users.users."${username}" = {
    packages = with pkgs; [
      #packages
      heroic
      vesktop
      steam
      vlc
      teams-for-linux
      nautilus
      gnome-console
      zapzap
      firefox-bin

      #development
      vscode
      github-desktop
      git
      nodePackages."@angular/cli"
      hoppscotch

      #nix
      nh
      nixfmt-rfc-style
      alejandra
      nixd
    ];
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  virtualisation.docker.enable = true;
}
