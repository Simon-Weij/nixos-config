{self, ...}: {
  flake.nixosModules.dev = {pkgs, ...}: let
    modules = self.nixosModules;
  in {
    imports = with modules; [
      development
      docker
      helix
      zellij
      ghostty
    ];
  };
}
