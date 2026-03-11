{
  pkgs,
  flakeConfig,
  ...
}: let
  vscodeModule = import ../../config/vscode/vscode.nix {
    inherit pkgs;
  };
in {
  users.users."${flakeConfig.username}" = {
    packages = with pkgs; [
      vscodeModule
      github-desktop
      git
      bruno
      distrobox
      android-studio
    ];
  };

  programs.nix-ld.enable = true;
}
