{
  inputs,
  lib,
  ...
}:
{
  flake.nixosModules.helix =
    { pkgs, ... }:
    let
      unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};

      hx = inputs.wrapper-modules.wrappers.helix.wrap {
        pkgs = unstable;

        package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;

        settings = {
          theme = "nord";

          editor = {
            line-number = "relative";
            mouse = true;
            inline-diagnostics.other-lines = "info";
            auto-format = true;
            default-yank-register = "+";
            mouse-yank-register = "+";
            indent-guides = {
              render = true;
            };
          };

        };

        languages = {
          language = [
            {
              name = "go";
              auto-format = true;
              formatter.command = lib.getExe pkgs.gofumpt;

              language-servers = [
                "gopls"
                "golangci-lint-lsp"
              ];
            }
          ];

          language-server = {
            gopls = {
              command = lib.getExe pkgs.gopls;
            };

            golangci-lint-lsp = {
              command = lib.getExe pkgs.golangci-lint-langserver;

              config = {
                command = [
                  (lib.getExe pkgs.golangci-lint)
                  "run"
                  "--output.json.path"
                  "stdout"
                  "--show-stats=false"
                  "--issues-exit-code=1"
                ];
              };
            };
          };
        };
      };
    in
    {
      environment.systemPackages = with pkgs; [
        hx

        tmux
        yazi

        # Go
        go
        gopls
        golangci-lint
        golangci-lint-langserver

        # Nix
        nixd
        nixfmt
      ];
    };
}
