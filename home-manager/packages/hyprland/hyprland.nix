{ config, pkgs, ... }:

{
  home.file = {
    "bin/start_hypr.sh" = {
      text = ''
        #!/bin/sh

        cd ~

        export _JAVA_AWT_WM_NONREPARENTING=1
        export XCURSOR_SIZE=24

        exec Hyprland
      '';
      executable = true;
    };
  };
  home.packages = with pkgs; [
    brightnessctl
    cliphist
    pywal
    rofi-wayland
    swaylock
    waybar
    wlogout
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "monitor" = ",1920x1080@60,auto,1";
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, SPACE, exec, rofi -show drun -replace"

        # Windows:
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        # "$mod, E, exec, ~/.config/scripts/filemanager.sh"
        "$mod, T, togglefloating"
        #"$mod SHIFT, T, exec, ~/.config/hypr/scripts/toggleallfloat.sh"
        "$mod SHIFT, J, togglesplit"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, l, movefocus, l"
        "$mod, h, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        "$mod SHIFT, right, resizeactive, 100 0"
        "$mod SHIFT, left, resizeactive, -100 0"
        "$mod SHIFT, up, resizeactive, 0 -100"
        "$mod SHIFT, down, resizeactive, 0 100"

        # Actions:
        #"$mod", PRINT, exec, ~/.config/hypr/scripts/screenshot.sh"
        "$mod CTRL, Q, exec, wlogout"
        #"$mod SHIFT, W, exec, ~/.config/hypr/scripts/wallpaper.sh"
        #"$mod CTRL, W, exec, ~/.config/hypr/scripts/wallpaper.sh select"
        #"$mod CTRL, RETURN, exec, rofi -show drun"
        #"$mod CTRL, H, exec, ~/.config/hypr/scripts/keybindings.sh"
        #"$mod SHIFT, B, exec, ~/.config/waybar/launch.sh"
        #"$mod SHIFT, R, exec, ~/.config/hypr/scripts/loadconfig.sh"
        #"$mod CTRL, F, exec, ~/.config/scripts/filemanager.sh"
        #"$mod CTRL, C, exec, ~/.config/scripts/cliphist.sh"
        #"$mod, V, exec, ~/.config/scripts/cliphist.sh"
        #"$mod CTRL, T, exec, ~/.config/waybar/themeswitcher.sh"
        #"$mod CTRL, S, exec, alacritty --class .config-floating -e ~/.config/hypr/settings/settings.sh"


        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Fn keys
        ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        ", XF86Calculator, exec, qalculate-gtk"
        ", XF86Lock, exec, swaylock"
        ", XF86Tools, exec, alacritty --class .config-floating -e ~/.config/hypr/settings/settings.sh"
    ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };

  xdg.configFile."waybar/waybar-black.css".source = ./waybar-black.css;
  xdg.configFile."waybar/waybar-base.css".source = ./waybar-base.css;
  xdg.configFile."waybar/waybar.config".source = ./waybar.config;
}
