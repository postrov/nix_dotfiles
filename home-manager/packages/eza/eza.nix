{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    eza
  ];

  programs.eza = {
    enable = true;
    icons = true;
    git = true;
  };

}
