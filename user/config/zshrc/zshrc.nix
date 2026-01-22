{
  pkgs,
  flakeConfig,
}: {
  ".zshrc".text = ''
    alias config='code /home/simon/Documents/nixos-config'
    alias dockernuke='docker system prune -a -f --volumes'
    alias dockerstop='docker stop $(docker ps -q)'
    alias docs='cd ~/Documents'
    alias neofetch='nix run nixpkgs#fastfetch'

    export NH_FLAKE="${flakeConfig.flakePath}#${flakeConfig.networking.hostName}"

    source ${
      pkgs.zsh-powerlevel10k
    }/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  '';
}
