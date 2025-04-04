{
  # parameters passed in from ~/.dotfiles/flake.nix. These were passed in via `inherit`
  browser,
  config,
  editor,
  inputs,
  lib,
  pkgs,
  shell,
  terminal,
  username,
  ...
}:
# https://nix-community.github.io/home-manager/options.xhtml
{
  home.username = "pasza";
  home.homeDirectory = "/home/pasza";
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  pasza.hyprland = {
    enable = true;
    monitor = [
      ",1920x1080@60,auto,1"
    ];
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["Hack"];}) # TODO: more?
    btop
    unzip
    zip
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # Below didn't work for me, at least in shell
  systemd.user.sessionVariables = {
    EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
    #    TERM = "fish";
  };

  home.sessionVariables = {
    EDITOR = "vim";
    VDPAU_DRIVER = "radeonsi";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  xdg.mime.enable = true; # Get xdg-utils, etc.
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
    };
  };

  # I have seperated every package I want on my system within its own directory and .nix file
  # This makes my system extreamly modular as each file is responsible for
  # downloading the package I want and dealing with its own settings.
  #
  # certain packages are easier to manage with seperate config files that nix can import (wezterm)
  # other packages can have the settings set within the .nix files and can get very long (fish).
  #
  # instead of having all those settings within this file, they are compartmentalized
  # If I want to remove a package from home-manager I can simply comment it out down below to turn it off
  # and uncomment it to turn it back on
  #
  # ~/.dotfiles/home-manager/packages/template.nix is the template I use when configuring a new package

  imports = [
    ../packages/bat/bat.nix
    #      ../packages/brave/brave.nix
    #      ../packages/direnv/direnv.nix
    ../packages/beekeeper/beekeeper.nix
    ../packages/chromium/chromium.nix
    ../packages/dbeaver/dbeaver.nix
    ../packages/dev-tools/dev-tools.nix
    ../packages/emacs/emacs.nix
    ../packages/erdtree/erdtree.nix
    ../packages/eza/eza.nix
    ../packages/fd/fd.nix
    #      ../packages/feh/feh.nix
    ../packages/firefox/firefox.nix
    ../packages/fish/fish.nix
    ../packages/fzf/fzf.nix
    ../packages/gcp/gcp.nix
    ../packages/ghostty/ghostty.nix
    ../packages/git/git.nix
    ../packages/helix/helix.nix
    ../packages/htop/htop.nix
    ../packages/httpie/httpie.nix
    ../packages/hyprland/hyprland.nix
    ../packages/keepassxc/keepassxc.nix
    ../packages/kitty/kitty.nix
    ../packages/lazygit/lazygit.nix
    #      ../packages/megasync/megasync.nix
    ../packages/nap/nap.nix
    ../packages/neovim/neovim.nix
    ../packages/nh/nh.nix
    #      ../packages/qbittorrent/qbittorrent.nix
    #      ../packages/rename/rename.nix
    ../packages/obsidian/obsidian.nix
    ../packages/postman/postman.nix
    ../packages/ripgrep/ripgrep.nix
    ../packages/signal-desktop/signal-desktop.nix
    ../packages/sd/sd.nix
    ../packages/slack/slack.nix
    ../packages/starship/starship.nix
    ../packages/tmux/tmux.nix
    ../packages/tree/tree.nix
    #      ../packages/vlc/vlc.nix
    ../packages/wezterm/wezterm.nix
    ../packages/vscode/vscode.nix
    ../packages/yazi/yazi.nix
    #      ../packages/ytdlp/ytdlp.nix
    ../packages/zellij/zellij.nix
    ../packages/zoxide/zoxide.nix

    #      ../scripts/youtube_channel_archiver/youtube_channel_archiver.nix
    #      ../scripts/single_song_downloader/single_song_downloader.nix
  ];
}
