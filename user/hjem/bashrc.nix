{
  hjem.users.simon.files = {
    ".bashrc".text = ''
      alias neofetch="nix-shell -p fastfetch --run fastfetch"
      alias tree="nix-shell -p tree --run tree"
      alias tokei="nix-shell -p tokei --run tokei"
      alias please="sudo"

      export NH_FLAKE="/home/simon/Documents/config"
    '';
  };
}