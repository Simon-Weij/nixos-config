{inputs, ...}: {
  flake.nixosModules.zsh = {
    pkgs,
    flakeConfig,
    ...
  }: {
    programs.zsh = {
      enable = true;
      promptInit = ''
        alias config='codium ${flakeConfig.flakePath}'
        alias dockernuke='docker system prune -a -f --volumes'
        alias dockerstop='docker stop $(docker ps -q)'
        alias docs='cd ~/Documents'

        alias lock=swaylock

        export NH_FLAKE="${flakeConfig.flakePath}#nixosConfigurations.${flakeConfig.networking.hostName}"

        PS1="%F{153}%n%f%F{250}@%f%F{33}%m%f %F{250}%1~%f ❯ "

        export EDITOR=codium

        alias code=codium

        export GTK_CSD=0

        alias cls=clear

        alias nd="nix develop"

        lfcd() {
          tmp="$(mktemp)"
          command lf -last-dir-path="$tmp" "$@"
          if [ -f "$tmp" ]; then
            dir="$(cat "$tmp")"
            rm -f "$tmp"
            [ -d "$dir" ] && cd "$dir"
          fi
        }

        calc() {
          echo "$(($*))"
        }

        lf() {
          lfcd "$@"
        }

        autoload -Uz compinit
        compinit
      '';
    };
  };
}
