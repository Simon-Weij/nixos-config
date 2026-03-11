{
  hjem = {
    clobberByDefault = true;
    linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
    users."${username}" = {
      user = "${username}";
      directory = "/home/${username}";
      files =
        userDirsFiles
        // {
          ".config/user-dirs.dirs" = {
            text = ''
              XDG_DOWNLOAD_DIR="$HOME/Downloads"
              XDG_DOCUMENTS_DIR="$HOME/Documents"
              XDG_PICTURES_DIR="$HOME/Pictures"
              XDG_VIDEOS_DIR="$HOME/Videos"
            '';
            type = "copy";
            permissions = "0644";
          };
        }
    };
  };
}
