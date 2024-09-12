{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."kitty/kitty.conf".source = ./kitty.conf;
  # To create a desktop item for a package under NixOs:
  # https://www.reddit.com/r/NixOS/comments/qhhki1/howto_create_a_package_and_provide_a_desktop_file/hictq95/

  # To create a desktop item for a package under home-manager:
  # https://www.reddit.com/r/NixOS/comments/scf0ui/how_would_i_update_desktop_file/hu5uhov/
  xdg.desktopEntries.kitty = {
    name = "Kitty";
    genericName = "Kitty";
    exec = "kitty";
    terminal = false; # true will pop up the system default terminal in addition to launching to program
    type = "Application";
    categories = [ "X-terminal" ];
  };  

}
