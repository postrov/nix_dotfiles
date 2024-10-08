{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Paweł Ostrowski";
    userEmail = "pasza@pasza.org";

    extraConfig = {
      # This makes git rebuild, which takes long time :(
      credential.helper = "${
          pkgs.git.override {
            withLibsecret = true;
            # Skip long tests:
            doInstallCheck = false;
          }
        }/bin/git-credential-libsecret";
      };
    };
}
