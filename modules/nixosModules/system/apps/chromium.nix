{inputs, ...}: {
  flake.nixosModules.chromium = {
    pkgs,
    flakeConfig,
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
      ];

      extraOpts = {
        DefaultSearchProviderEnabled = true;
        DefaultSearchProviderName = "Duckduckgo";
        DefaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
        DefaultSearchProviderSuggestURL = "https://duckduckgo.com/ac/?q={searchTerms}&type=list";
        DefaultSearchProviderIconURL = "https://duckduckgo.com/favicon.ico";
      };
    };

    users.users."${flakeConfig.username}".packages = [
      (pkgs.symlinkJoin {
        name = "chromium-icons";
        paths = [pkgs.chromium];
        pathsToLink = ["/share/icons"];
      })
    ];
    programs.firejail.wrappedBinaries.chromium = {
      executable = "${pkgs.chromium}/bin/chromium";
      profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
      desktop = "${pkgs.chromium}/share/applications/chromium-browser.desktop";
    };
  };
}
