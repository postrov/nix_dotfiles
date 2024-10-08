{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.pasza.hyprland.enable {
    programs.mpv = {
      enable = true;
      config = {
        hwdec = "auto-safe";
        vo = "gpu";
        profile = "gpu-hq";
        gpu-context = "wayland";
      };
    };
  };
}
