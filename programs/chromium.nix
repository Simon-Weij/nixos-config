{
  flakeConfig,
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;

    homepageLocation = "https://www.duckduckgo.com/";

    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx" # dark reader

      "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx" # ublock

      "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # bitwarden

      "mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx" # sponsorblock

      "hfjbmagddngcpeloejdejnfgbamkjaeg;https://clients2.google.com/service/update2/crx" # vimium C

      "bihgaolammfihpmkpphbngkhdelcnkfa;https://clients2.google.com/service/update2/crx" # Middle click scroll

      "hjfkenebldkfgibelglepinlabpjfbll;https://clients2.google.com/service/update2/crx" # No shorts

      "hlepfoohegkhhmjieoechaddaejaokhf;https://clients2.google.com/service/update2/crx" # Refined github
    ];

    extraOpts = {
      DefaultSearchProviderEnabled = true;
      DefaultSearchProviderName = "DuckDuckGo";
      DefaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
      DefaultSearchProviderSuggestURL = "https://duckduckgo.com/ac/?q={searchTerms}&type=list";
      DefaultSearchProviderIconURL = "https://duckduckgo.com/favicon.ico";
      WebAppInstallForceList = [
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

  users.users."${flakeConfig.username}".packages = [
    pkgs.chromium
  ];
}
