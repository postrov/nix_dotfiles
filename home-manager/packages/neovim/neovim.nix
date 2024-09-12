{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    neovim
  ];

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /home/pasza/my_dotfiles/.config/nvim;
}
