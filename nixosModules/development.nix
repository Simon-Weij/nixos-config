{
  flakeConfig,
  pkgs,
  ...
}: {
  users.users."${flakeConfig.username}" = {
    packages = with pkgs; [
      git
      bruno
    ];
  };

  programs.direnv = {
    enable = true;
    silent = true;
  };

  programs.nix-ld.enable = true;
}
