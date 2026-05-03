{inputs, ...}: {
  flake.nixosModules.zsh = {
    pkgs,
    flakeConfig,
    ...
  }: {
    programs.zsh = {
      enable = true;
      promptInit = ''
        alias config='nvim ${flakeConfig.flakePath}'
        alias dockernuke='docker system prune -a -f --volumes'
        alias dockerstop='docker stop $(docker ps -q)'
        alias docs='cd ~/Documents'
        alias dcu='docker compose up'
        alias pn='pnpm'
        alias f='niri-session'
        alias code='nvim'
        alias cls=clear
        alias nd="nix develop"
        alias noctalia-update='noctalia-shell ipc call state all > ${flakeConfig.flakePath}/modules/nixosModules/system/desktop/noctalia/noctalia.json'
        alias grun='go run ./...'

        alias ze='zellij'
        alias rb='nh os switch'

        export EDITOR='nvim'

        export NH_FLAKE="${flakeConfig.flakePath}#nixosConfigurations.${flakeConfig.networking.hostName}"
        PS1="%F{153}%n%f%F{250}@%f%F{33}%m%f %F{250}%1~%f ❯ "

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
