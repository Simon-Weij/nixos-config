{
  pkgs,
  flakeConfig,
  inputs,
  ...
}: {
  programs.bash = {
    promptInit = ''
      alias config='nvim ${flakeConfig.flakePath}'
      alias dockernuke='docker system prune -a -f --volumes'
      alias dockerstop='docker stop $(docker ps -q)'
      alias docs='cd ~/Documents'

      export NH_FLAKE="${flakeConfig.flakePath}#${flakeConfig.networking.hostName}"

      export PS1="\[\e[38;5;153m\]\u\[\e[0m\]\[\e[38;5;250m\]@\[\e[0m\]\[\e[38;5;33m\]\h\[\e[0m\] \[\e[38;5;250m\]\W\[\e[0m\] ❯ "

      export EDITOR=nvim

      alias code=codium

      alias cls=clear

      alias nd="nix develop"
    '';

    completion.enable = true;
  };
}
