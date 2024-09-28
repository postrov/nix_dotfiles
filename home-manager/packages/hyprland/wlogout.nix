{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.pasza.hyprland.enable {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          "label" = "lock";
          "action" = "sleep 1; swaylock";
          "text" = "Lock";
          "keybind" = "l";
        }
        {
          "label" = "hibernate";
          "action" = "sleep 1; systemctl hibernate";
          "text" = "Hibernate";
          "keybind" = "h";
        }
        {
          "label" = "logout";
          "action" = "hyprctl dispatch exit";
          "text" = "Exit";
          "keybind" = "e";
        }
        {
          "label" = "shutdown";
          "action" = "sleep 1; systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "s";
        }
        {
          "label" = "suspend";
          "action" = "sleep 1; systemctl suspend";
          "text" = "Suspend";
          "keybind" = "u";
        }
        {
          "label" = "reboot";
          "action" = "sleep 1; systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
        }
      ];
    };
  };
}
