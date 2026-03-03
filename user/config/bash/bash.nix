{
  pkgs,
  flakeConfig,
  inputs,
  ...
}: {
  programs.bash = {
    promptInit = ''
      alias config='${pkgs.neovim}/bin/nvim ${flakeConfig.flakePath}'
      alias dockernuke='docker system prune -a -f --volumes'
      alias dockerstop='docker stop $(docker ps -q)'
      alias docs='cd ~/Documents'

      alias lock=${pkgs.swaylock}/bin/swaylock

      export NH_FLAKE="${flakeConfig.flakePath}#${flakeConfig.networking.hostName}"

      export PS1="\[\e[38;5;153m\]\u\[\e[0m\]\[\e[38;5;250m\]@\[\e[0m\]\[\e[38;5;33m\]\h\[\e[0m\] \[\e[38;5;250m\]\W\[\e[0m\] ❯ "

      export EDITOR=${pkgs.neovim}/bin/neovim

      alias code=${pkgs.vscodium}/bin/codium

      alias cls=clear

      alias nd="nix develop"
    '';

    completion.enable = true;
  };
}
