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
          color = "1e1e2e";
          indicator-radius = 100;
          show-failed-attempts = true;
        };
      }).wrapper;
  in {
    environment.systemPackages = [swaylockWrapped];
  };
}
