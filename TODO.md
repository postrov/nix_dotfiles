[x] zoxide
[x] neovim
  [x] how to symlink to dofile repo?
[x] better fish config
  [x] reduce needless aliases
  [x] integrate zoxide: `zoxide init fish | source`
  [x] make sure everything from regular dotfiles is reproduced
  [x] fix fish functions not running on first invocation
  [x] fix bash (no fish) on login (just added .bash_profile to include .bashrc)
[-] my font?
[x] terminal config (kitty? foot?)
[x] hyprland..
  [x] set scaling to 1.0
  [x] set input layout to pl
  [x] extract options (resolution)
  [x] configure waybar
    [x] exec with hyprland
    [ ] some glyphs missing with current font
[x] git

[x] tmux
[ ] how to do ssh config?
[x] fzf
[x] firefox config
  [x] user chrome can be done with nix
[x] get rid of tabs in nix files (retab, etc.)
[x] start dbus with hyprland (fixes problems with accessing secret service)
[x] configure wlogout
[-] starship conf
[ ] dev environment (write own flake?)
  [x] go (in go-rest-api, including build and run)
  [ ] cgo, static build, musl (https://nixos.wiki/Go#Using_cgo_on_NixOS)
  [x] ocaml
  [ ] ocaml simpler, non nix-packaged libs (https://priver.dev/blog/ocaml/bye-opam-hello-nix/)
[x] podman
  [x] install podman itself
  [?] auto start user sock service (starts now, perhaps after initial `systemctl --user start podman.socket`)
[x] add options
  [-] enable podman (this is done in host/configuration.nix, while config.pasza is defined in home.nix, skip for now)
  [x] enable hyprland desktop
[ ] terminal colors with nix-colors (https://www.youtube.com/watch?v=jO2o0IN0LPE)
[x] dark mode?
  [x] dconf read /org/gnome/desktop/interface/color-scheme # => prefer-dark
  [x] firefox doesn't seem to care
  [x] gtk?
  [ ] qt
[x] obsidian
[x] slack
[x] chromium
[x] vscode-fhs
  [ ] perhaps configure
[x] dbeaver-bin
[x] bluetooth
[x] cliphist
  [x] wl-clipboard
  [x] xdg-utils
  [-] display preview (nwg-clipman can do it, maybe write own)
[x] screenshots (grim, ~/tmp/scr.sh)
[x] notifications (notify-send - libnotify, daemon - dunst/mako)
[ ] FIX: rofi complaining about missing wallpaper
[ ] todo.sh setup
[ ] FIX: firefox video playback issue
[ ] janet-lsp installed manually in tmp/janet-lsp + ~/bin/janet-lsp (needed to add shebang to startup script)
