{...}: {
  flake.nixosModules.nvim-languages = { ... }: {
    vim.languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      css.enable = true;
      dart.enable = true;
      qml = {
        enable = true;
        format.enable = true;
        treesitter.enable = true;
        lsp.enable = true;
      };
      go.enable = true;
      html.enable = true;
      json.enable = true;
      just.enable = true;
      markdown.enable = true;
      nix = {
        enable = true;
        format = {
          enable = true;
          type = ["alejandra"];
        };
      };
      php.enable = true;
      python.enable = true;
      rust.enable = true;
      sql.enable = true;
      svelte.enable = true;
      toml.enable = true;
      typescript.enable = true;
      yaml.enable = true;
    };
  };
}
