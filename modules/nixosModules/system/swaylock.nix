{inputs, ...}: {
  flake.nixosModules.swaylock = {
    pkgs,
    self,
    ...
  }: let
    swaylockWrapped =
      (inputs.wrappers.wrapperModules.swaylock.apply {
        inherit pkgs;
        settings = {
          color = "#000000";
        };
      }).wrapper;
  in {
    environment.systemPackages = [swaylockWrapped];
  };
}
