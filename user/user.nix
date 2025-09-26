{ pkgs, ... }:
{
  users.users.simon = {
    isNormalUser = true;
    description = "Simon";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    hashedPassword = "$y$j9T$Lh5xfMWjdQPXq1SY5h1if.$H04U9/Kfl1YHR7shomYVpltWWjx/oNR4PCtuLQ8IxRA";
  };
}