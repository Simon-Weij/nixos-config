{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.wrapper-modules.nixosModules.neovim];
  wrappers.neovim = {
    enable = true;
    specs.general = with pkgs.vimPlugins; [
      nord-nvim
      mini-nvim
    ];
    runtimePkgs = [];
    settings = {
      aliases = ["vi"];
      config_directory = ./.;
    };
  };
}
