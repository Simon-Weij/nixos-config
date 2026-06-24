{
  inputs,
  pkgs,
  ...
}: let
  wlib = inputs.wrapper-modules.lib;
  zellij-wrapped = wlib.wrapPackage ({config, ...}: {
    inherit pkgs;
    package = pkgs.zellij;
    constructFiles.zellijConfig = {
      relPath = "config.kdl";
      content = ''
            theme "nord"

            keybinds clear-defaults=true {
            normal {
                unbind "Ctrl h" "Ctrl l"
                bind "F12" { GoToNextTab; }
                bind "Shift F12" { GoToPreviousTab; }
            }

            pane {
                bind "Ctrl p" { SwitchToMode "Normal"; }
                bind "n" { NewPane; SwitchToMode "Normal"; }
                bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
                bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
                bind "x" { CloseFocus; SwitchToMode "Normal"; }
                bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0; }
            }

            move {
                bind "Ctrl h" { SwitchToMode "Normal"; }
                bind "n" "Tab" { MovePane; }
                bind "p" { MovePaneBackwards; }
                bind "h" "Left" { MovePane "Left"; }
                bind "j" "Down" { MovePane "Down"; }
                bind "k" "Up" { MovePane "Up"; }
                bind "l" "Right" { MovePane "Right"; }
            }

            tab {
                bind "Ctrl t" { SwitchToMode "Normal"; }
                bind "n" { NewTab; SwitchToMode "Normal"; }
                bind "h" "Left" "Up" "k" { GoToPreviousTab; }
                bind "l" "Right" "Down" "j" { GoToNextTab; }
                bind "x" { CloseTab; SwitchToMode "Normal"; }
                bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
            }

            renametab {
                bind "Ctrl c" { SwitchToMode "Normal"; }
                bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
            }

            renamepane {
                bind "Ctrl c" { SwitchToMode "Normal"; }
                bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
            }

            shared_except "normal" "locked" {
                bind "Enter" "Esc" { SwitchToMode "Normal"; }
            }

            shared_except "pane" "locked" {
                bind "Ctrl p" { SwitchToMode "Pane"; }
            }
            shared_except "move" "locked" {
                bind "Ctrl h" { SwitchToMode "Move"; }
            }

            shared_except "tab" "locked" {
                bind "Ctrl t" { SwitchToMode "Tab"; }
            }
        }

        show_startup_tips false
      '';
    };
    flags."--config" = config.constructFiles.zellijConfig.path;
  });
in {
  environment.systemPackages = [
    zellij-wrapped
  ];
}
