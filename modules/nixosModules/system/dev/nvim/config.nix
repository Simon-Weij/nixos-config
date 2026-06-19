{...}: {
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
    };
    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };
    diagnostics = {
      enable = true;

      presets = {
        golangci-lint.enable = true;
      };

      nvim-lint = {
        enable = true;
        linters = {
          eslint_d = {
            required_files = [
              "eslint.config.js"
              "eslint.config.mjs"
              "eslint.config.cjs"
              ".eslintrc.js"
              ".eslintrc.cjs"
              ".eslintrc.json"
              ".eslintrc.yml"
              ".eslintrc"
            ];
          };
          golangci-lint = {
            required_files = [
              "golangci-lint.yml"
              ".golangci.yml"
              ".golangci.yaml"
              ".golangci.toml"
              ".golangci.json"
            ];
          };
        };
      };

      config = {
        virtual_text = {
          prefix = "●";
          spacing = 2;
          source = "if_many";
        };
        viAlias = true;
        vimAlias = true;
      };
    };
  };
}
