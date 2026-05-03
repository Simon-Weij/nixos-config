{...}: {
  flake.nixosModules.nvim-lsp = {lib, ...}: {
    vim.lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = false;
      lspsaga.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      presets.harper.enable = true;
      servers.qmlls.cmd = lib.mkForce ["qmlls" "-E"];
    };
  };
}
