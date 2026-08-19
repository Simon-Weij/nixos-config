{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.helium.overlays.default];
  environment.systemPackages = [pkgs.helium];

  programs.helium = {
    enable = true;
    policies = {
      "ExtensionInstallForcelist" = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark reader

        "nngceckbapebfimnlniiiahkandclblb" # bitwarden

        "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock

        "hfjbmagddngcpeloejdejnfgbamkjaeg" # vimium C

        "bihgaolammfihpmkpphbngkhdelcnkfa" # Middle click scroll

        "hjfkenebldkfgibelglepinlabpjfbll" # No shorts

        "hlepfoohegkhhmjieoechaddaejaokhf" # Refined github
      ];
      "DefaultSearchProviderEnabled" = true;
      "DefaultSearchProviderName" = "DuckDuckGo";
      "DefaultSearchProviderSearchURL" = "https://duckduckgo.com/?q={searchTerms}";
      "DefaultSearchProviderSuggestURL" = "https://duckduckgo.com/ac/?q={searchTerms}&type=list";
      "DefaultSearchProviderIconURL" = "https://duckduckgo.com/favicon.ico";

      "WebAppInstallForceList" = [
        {
          "custom_name" = "Discord";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://discord.com/login";
        }
        {
          "custom_name" = "Teams";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://teams.microsoft.com/v2/";
        }
        {
          "custom_name" = "Commet";
          "create_desktop_shortcut" = true;
          "default_launch_container" = "window";
          "url" = "https://app.commet.chat/";
        }
      ];
    };
  };
}
