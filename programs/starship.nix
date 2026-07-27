{pkgs, ...}: {
  environment = {
    etc."starship.toml".source = (pkgs.formats.toml {}).generate "starship.toml" {
      add_newline = true;
      format = "$nix_shell$directory\n$character";
      nix_shell = {
        symbol = "❄️ ";
        format = "[$symbol]($style)";
      };
    };
    systemPackages = [pkgs.starship];
  };
}
