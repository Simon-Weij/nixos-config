{
  inputs,
  pkgs,
  lib,
  ...
}: let
  script = pkgs.writeShellScript "tests.sh" ''
    FILE=$1
    LINE=$2
    FUNC=$(awk -v line="$LINE" '
      NR <= line && /^func/ {
        for (i=1; i<=NF; i++) if ($i ~ /\(/ && $i !~ /^\(/) { current = $i; break }
      }
      END { print current }
    ' "$FILE" | cut -d'(' -f1)
    ${lib.getExe pkgs.gotests} -w -only "^''${FUNC}$" "''${FILE}"
  '';
  hx = inputs.wrapper-modules.wrappers.helix.wrap {
    inherit pkgs;
    package = pkgs.helix.overrideAttrs (prev: {
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
        space.t = ":sh ${script} %{buffer_name} %{cursor_line}";
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
          language-servers = ["svelteserver" "typescript-language-server" "eslint-lsp" "tailwindcss-ls"];
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.prettier;
          };
          language-servers = ["typescript-language-server" "eslint-lsp" "tailwindcss-ls"];
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
        tailwindcss-ls = {
          command = "tailwindcss-language-server";
          args = ["--stdio"];
        };
      };
    };
  };
in {
  environment.systemPackages = with pkgs; [
    hx

    # Nix
    nixd
    alejandra

    # Web
    svelte-language-server
    typescript-language-server
    eslint
    vscode-langservers-extracted
    tailwindcss-language-server
  ];
  programs.nano.enable = false;
}
