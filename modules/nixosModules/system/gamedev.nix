{inputs, ...}: {
  flake.nixosModules.gamedev = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}" = {
      packages = with pkgs; [
        godot
        aseprite
      ];
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    programs.nix-ld.enable = true;
  };
}
