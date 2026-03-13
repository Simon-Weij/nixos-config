{inputs, ...}: {
  flake.nixosModules.chromium = {
    pkgs,
    flakeConfig,
    ...
  }: {
    programs.chromium = {
      enable = true;

      homepageLocation = "https://www.startpage.com/";

      extensions = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh;https://clients2.google.com/service/update2/crx" # dark reader

        "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx" # ublock

        "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # bitwarden

        "mnjggcdmjocbbbhaepdhchncahnbgone;https://clients2.google.com/service/update2/crx" # sponsorblock

        "hfjbmagddngcpeloejdejnfgbamkjaeg;https://clients2.google.com/service/update2/crx" # vimium C

        "bihgaolammfihpmkpphbngkhdelcnkfa;https://clients2.google.com/service/update2/crx" # Middle click scroll
      ];

      extraOpts = {
        DefaultSearchProviderEnabled = true;
        DefaultSearchProviderName = "Startpage";
        DefaultSearchProviderSearchURL = "https://www.startpage.com/sp/search?query={searchTerms}";
        DefaultSearchProviderSuggestURL = "https://www.startpage.com/sp/search?query={searchTerms}";
        DefaultSearchProviderIconURL = "https://www.startpage.com/favicon.ico";
      };
    };
    users.users."${flakeConfig.username}".packages = with pkgs; [
      chromium
    ];
  };
}
