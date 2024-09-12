{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    nap
  ];

}
