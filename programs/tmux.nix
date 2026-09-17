{
  inputs,
  pkgs,
  ...
}: let
  tmuxWrapped = inputs.wrapper-modules.wrappers.tmux.wrap {
    inherit pkgs;

    plugins = [
      {
        plugin = inputs.nord-tmux;
        rtp = "${inputs.nord-tmux}/nord.tmux";
      }
    ];

    configAfter = ''
      set -g prefix F12
      set -g set-clipboard on
      set -g default-terminal "tmux-256color"
      set -g focus-events on

      unbind C-b
      bind F12 send-prefix

      bind u split-window -h -c "#{pane_current_path}"
      bind v split-window -v -c "#{pane_current_path}"

      bind n next-window
      bind p previous-window
      bind c new-window

      bind w kill-pane

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      bind-key s choose-tree -s
      bind-key N new-session
    '';
  };
in {
  environment.systemPackages = [
    tmuxWrapped
    pkgs.wl-clipboard
  ];
}
