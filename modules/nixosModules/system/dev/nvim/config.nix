{...}: {
  flake.nixosModules.nvim-config = { ... }: {
    vim = {
      options = {
        autoindent = true;
        smartindent = true;
        backspace = "indent,eol,start";
        copyindent = true;
        formatoptions = "jcroqlnt";
        expandtab = true;
        number = true;
        relativenumber = true;
        cursorline = true;
        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;
        mouse = "";

        foldcolumn = "1";
        foldlevel = 99;
        foldlevelstart = 99;
        foldenable = true;
        foldminlines = 0;
      };

      autocmds = [
        {
          event = ["FileType"];
          pattern = ["go" "make"];
          command = "setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4";
        }
        {
          event = ["FileType"];
          pattern = ["python" "rust" "php" "sql" "qml"];
          command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4";
        }
        {
          event = ["FileType"];
          pattern = [
            "nix"
            "json"
            "yaml"
            "toml"
            "typescript"
            "javascript"
            "typescriptreact"
            "javascriptreact"
            "css"
            "html"
            "svelte"
            "dart"
            "markdown"
            "bash"
            "sh"
            "zsh"
          ];
          command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2";
        }
        {
          event = ["FileType"];
          pattern = ["neo-tree"];
          command = "setlocal nofoldenable foldlevel=99 foldcolumn=0 | silent! UfoDetach";
        }
        {
          event = ["FileType"];
          pattern = ["TelescopeResults"];
          command = "setlocal number relativenumber";
        }
      ];

      globals = {
        mapleader = " ";
      };

      viAlias = true;
      vimAlias = true;
    };
  };
}
