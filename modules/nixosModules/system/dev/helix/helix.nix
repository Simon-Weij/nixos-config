{
  inputs,
  lib,
  ...
}: {
  flake.nixosModules.helix = {pkgs, ...}: let
    unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};

    hx = inputs.wrapper-modules.wrappers.helix.wrap {
      pkgs = unstable;
      package = unstable.helix.overrideAttrs (prev: {
        version = "master";
        src = inputs.helix;
      });

      settings = {
        theme = "nord";
        keys.insert = {
          C-l = "move_char_right";
          C-h = "move_char_left";
          C-k = "move_visual_line_up";
          C-j = "move_visual_line_down";
          C-w = "move_next_word_start";
          C-b = "move_prev_word_start";
        };
        keys.normal = {
          space.o = [
            ":sh rm -f /tmp/unique-ca1ea106"
            ":insert-output yazi \"%{buffer_name}\" --chooser-file=/tmp/unique-ca1ea106"
            ":sh printf \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
            ":open %sh{cat /tmp/unique-ca1ea106}"
            ":redraw"
            ":set mouse false"
            ":set mouse true"
          ];
        };
        editor = {
          line-number = "relative";
          mouse = true;
          inline-diagnostics.other-lines = "info";
          auto-format = true;
          default-yank-register = "+";
          indent-guides.render = true;
          cursor-shape.insert = "bar";
        };
      };
      languages = {
        language = [
          {
            name = "go";
            auto-format = true;
            formatter.command = lib.getExe pkgs.gofumpt;
            language-servers = ["gopls" "golangci-lint-lsp"];
          }
          {
            name = "nix";
            auto-format = true;
            formatter.command = lib.getExe pkgs.alejandra;
          }
          {
            name = "svelte";
            auto-format = true;
            formatter = {
              command = lib.getExe pkgs.prettier;
              args = ["--parser" "svelte"];
            };
            language-servers = ["svelteserver" "eslint-lsp"];
          }
          {
            name = "typescript";
            auto-format = true;
            formatter = {
              command = lib.getExe pkgs.prettier;
            };
            language-servers = ["typescript-language-server" "eslint-lsp"];
          }
        ];
        language-server = {
          gopls.command = lib.getExe pkgs.gopls;
          golangci-lint-lsp = {
            command = lib.getExe pkgs.golangci-lint-langserver;
            config.command = [
              (lib.getExe pkgs.golangci-lint)
              "run"
              "--output.json.path"
              "stdout"
              "--show-stats=false"
              "--issues-exit-code=1"
            ];
          };
          eslint-lsp = {
            command = "vscode-eslint-language-server";
            args = ["--stdio"];
            config = {
              experimental.useFlatConfig = true;
              validate = "on";
              run = "onType";
              nodePath = "";
              problems.shortenToSingleLine = false;
              rulesCustomizations = [];
            };
          };
        };
      };
    };
  in {
    environment.systemPackages = with unstable; [
      hx
      yazi
      zellij

      # Nix
      nixd
      alejandra

      # Web
      svelte-language-server
      typescript-language-server
      eslint
      vscode-langservers-extracted
    ];
  };
}
