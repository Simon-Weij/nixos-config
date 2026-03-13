{inputs, ...}: {
  flake.nixosModules.development = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}" = {
      packages = with pkgs; [
        github-desktop
        git
        bruno
        distrobox
        android-studio

        nh
        alejandra
        nixd
      ];
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    programs.nix-ld.enable = true;
  };
}
