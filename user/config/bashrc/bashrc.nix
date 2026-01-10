{flakeConfig}: {
  ".bashrc".text = ''
    alias config='code /home/simon/Documents/nixos-config'
    alias dockernuke='docker system prune -a -f --volumes'
    alias dockerstop='docker stop $(docker ps -q)'
    alias docs='cd ~/Documents'
    alias neofetch='nix run nixpkgs#fastfetch'

    export NH_FLAKE="${flakeConfig.flakePath}#${flakeConfig.networking.hostName}"
  '';
}
