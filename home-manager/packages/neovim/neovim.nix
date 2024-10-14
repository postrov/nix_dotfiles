{ config, pkgs, ... }@inputs:

let
  unstable = inputs.my-nixpkgs.from.unstable;
in
{

  home.packages = with pkgs; [
    unstable.neovim
  ];

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /home/pasza/my_dotfiles/.config/nvim;
}
