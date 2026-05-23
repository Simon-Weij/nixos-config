{inputs, ...}: {
  flake.nixosModules.development = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}" = {
      packages = with pkgs; [
        git
      ];
    };

    programs.direnv = {
      enable = true;
      silent = true;
    };

    programs.nix-ld.enable = true;
  };
}
