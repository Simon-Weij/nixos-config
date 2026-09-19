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
    ];
    runtimePkgs = [];
    settings = {
      aliases = ["vi"];
      config_directory = ./.;
    };
  };
}
