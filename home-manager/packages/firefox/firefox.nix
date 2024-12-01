{
  config,
  pkgs,
  ...
} @ inputs: let
  unstable = inputs.my-nixpkgs.from.unstable;
in {
  home.packages = with pkgs; [
    # firefox
    # unstable.firefox
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
