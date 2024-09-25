{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        userChrome = ''
          #TabsToolbar
          {
              visibility: collapse;
          }
        '';
        extraConfig = builtins.readFile ./user.js;
      };
    };
  };
}
