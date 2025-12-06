{
  inputs,
  flakeConfig,
  pkgs,
  ...
}:
let
  username = flakeConfig.username;
in
{
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    hashedPassword = "$y$j9T$Lh5xfMWjdQPXq1SY5h1if.$H04U9/Kfl1YHR7shomYVpltWWjx/oNR4PCtuLQ8IxRA";
    packages = with pkgs; [
      ungoogled-chromium
      ghostty
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
    ];
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ghostty";
  };

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
      "org.gnome.design.IconLibrary"
    ];
  };

  virtualisation.docker.enable = true;

  home-manager = {
    useGlobalPkgs = false;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs flakeConfig; };
    users."${username}" = import ./home/home.nix;
    sharedModules = [
      {
        nixpkgs.config.allowUnfree = true;
      }
    ];
  };
}
