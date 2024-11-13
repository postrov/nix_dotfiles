{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.pasza.hyprland.enable {
    programs.swaylock = {
      enable = true;
      settings = {
        ignore-empty-password = true;
        color = "330033";
        # image = "~/Pictures/wallpapers/hyprland.jpg";
      };
    };
  };
}
