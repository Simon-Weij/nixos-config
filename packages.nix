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
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

      #development
      vscode
      github-desktop
      git
      nodejs
      nodePackages."@angular/cli"
      nodePackages."@nestjs/cli"
      hoppscotch
      distrobox

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
