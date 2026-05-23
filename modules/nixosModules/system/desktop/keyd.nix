{...}: {
  flake.nixosModules.keyd = {pkgs, ...}: {
    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "f13";
          };
        };
      };
    };
  };
}
