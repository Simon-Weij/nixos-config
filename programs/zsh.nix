{flakeConfig, ...}: {
  programs.zsh = {
    enable = true;
    promptInit = ''
      alias config='cd ${flakeConfig.flakePath}'
      alias dockernuke='docker system prune -a -f --volumes'
      alias dockernukevolume='docker volume rm $(docker volume ls -q)'
      alias dockerstop='docker stop $(docker ps -q)'
      alias docs='cd ~/Documents'
      alias dcu='docker compose up'
      alias pn='pnpm'
      alias f='niri-session'
      alias cls=clear
      alias nd="nix develop"
      alias noctalia-update='noctalia-shell ipc call state all > ${flakeConfig.flakePath}/modules/nixosModules/system/desktop/noctalia/noctalia.json'
      alias grun='go run ./...'
      alias gtest='go test ./...'
      alias crun='cargo run --'
      alias lock='noctalia-shell ipc call lockScreen lock'
      alias dc='concord'
      alias spotifyrun='nix run github:Gerg-L/spicetify-nix/3fdc209a45ff9b4e95596feb3be1684d9da51735#test'

      alias ze='zellij'
      alias rb='nh os switch'
      alias yz='yazi'

      export EDITOR='hx'

      export NH_FLAKE="${flakeConfig.flakePath}#nixosConfigurations.${flakeConfig.networking.hostName}"
      PS1="%F{153}%n%f%F{250}@%f%F{33}%m%f %F{250}%1~%f ❯ "

      setopt AUTO_CD

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
}
