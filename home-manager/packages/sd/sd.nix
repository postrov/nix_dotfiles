{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    sd
  ];

}
