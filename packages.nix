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
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      thunderbird

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
      alejandra
      nixd
    ];
  };

  virtualisation = {
    docker.enable = true;
    waydroid.enable = true;
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
