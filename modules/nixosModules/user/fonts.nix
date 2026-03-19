{inputs, ...}: {
  flake.nixosModules.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      adwaita-fonts
    ];

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font" "Adwaita Sans"];
        sansSerif = ["JetBrainsMono Nerd Font" "Adwaita Sans"];
        serif = ["JetBrainsMono Nerd Font" "Adwaita Sans"];
      };
    };
  };
}
