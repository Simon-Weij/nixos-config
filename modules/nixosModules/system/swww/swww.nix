{inputs, ...}: {
  flake.nixosModules.swww = {pkgs, ...}: {
    environment = {
      etc."wallpapers/wallpaper.jpg".source =
        ./wallpaper.jpg;
      systemPackages = [
        pkgs.swww
      ];
    };
  };
}
