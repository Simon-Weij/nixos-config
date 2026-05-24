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
