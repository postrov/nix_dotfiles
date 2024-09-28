{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.pasza-hyprland.enable {
    # Configuring this in nix seemed like too much hassle for now
    xdg.configFile."waybar/waybar-black.css".source = ./waybar-black.css;
    xdg.configFile."waybar/waybar-base.css".source = ./waybar-base.css;
    xdg.configFile."waybar/waybar.config".source = ./waybar.config;
  };
}
