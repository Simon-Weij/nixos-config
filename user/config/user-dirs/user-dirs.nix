{flakeConfig}: {
  ".config/user-dirs.dirs".text = ''
    XDG_DOWNLOAD_DIR="$HOME/Downloads"
    XDG_DOCUMENTS_DIR="$HOME/Documents"
    XDG_PICTURES_DIR="$HOME/Pictures"
    XDG_VIDEOS_DIR="$HOME/Videos"
  '';
}
