{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
       bindm = [
         "$mod, mouse:272, movewindow"
         "$mod, mouse:273, resizewindow"
         "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };
}
