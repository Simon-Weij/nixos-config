{pkgs, ...}: let
  hytale-hash = "sha256-kaNj1xQkednvgIXQTP1ZJBbnL8UP9xKKS53PgA/uqUg=";
in {
  services.flatpak = {
    enable = true;
    packages = [
      "org.prismlauncher.PrismLauncher"
      "com.dec05eba.gpu_screen_recorder"
      "org.gnome.Boxes"
      "com.usebottles.bottles"
      "org.vinegarhq.Sober"
      "org.gnome.Builder"
      {
        appId = "com.hytale.Launcher";
        sha256 = hytale-hash;
        bundle = "${pkgs.fetchurl {
          url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak";
          sha256 = hytale-hash;
        }}";
      }
    ];
  };
}
