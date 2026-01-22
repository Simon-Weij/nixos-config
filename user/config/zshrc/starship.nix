{flakeConfig}: {
  ".config/starship.toml".text = ''
    "$schema" = 'https://starship.rs/config-schema.json'
    add_newline = true

    [character]
    success_symbol = '[➜](bold green)'

    [package]
    disabled = true
  '';

  ".p10k.zsh".file = ./p10k.zsh;
}
