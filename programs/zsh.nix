{
  flakeConfig,
  pkgs,
  inputs,
  ...
}: {
  programs.zsh = {
    enable = true;

    promptInit = ''
      PS1='%F{#81A1C1}%~ %F{#88C0D0}❯%f '
      KEYTIMEOUT=1

      export NH_FLAKE="${flakeConfig.flakePath}#${flakeConfig.networking.hostName}"

      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${inputs.zsh-helix-mode}/zsh-helix-mode.plugin.zsh

      # Start lines in insert mode
      zle-line-init() {
        zle zhm_insert
      }
      zle -N zle-line-init

      # https://github.com/Multirious/zsh-helix-mode#compatibility
      ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(
        zhm_history_prev
        zhm_history_next
        zhm_prompt_accept
        zhm_accept
        zhm_accept_or_insert_newline
      )

      ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(
        zhm_move_right
        zhm_clear_selection_move_right
      )

      ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(
        zhm_move_next_word_start
        zhm_move_next_word_end
      )

      if [[ -z "$TMUX" && "$TERM" == "xterm-kitty" ]]; then
        tmux new -A
      fi
    '';
  };
}
