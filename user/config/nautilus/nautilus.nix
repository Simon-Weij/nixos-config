{
  inputs,
  pkgs,
  ...
}: {
  package = inputs.wrappers.lib.wrapPackage {
    inherit pkgs;
    package = pkgs.nautilus;
    args = [
      "--set XDG_DOWNLOAD_DIR $HOME/Downloads"
      "--set XDG_DOCUMENTS_DIR $HOME/Documents"
      "--set XDG_PICTURES_DIR $HOME/Pictures"
      "--set XDG_VIDEOS_DIR $HOME/Videos"
    ];
  };
}
