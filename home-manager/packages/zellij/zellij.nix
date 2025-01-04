{
  config,
  pkgs,
  ...
} @ inputs: let
  unstable = inputs.my-nixpkgs.from.unstable;
in {
  # home.packages = with pkgs; [
  #   zellij
  # ];
  home.packages = [
    unstable.zellij
  ];

  programs.zellij = {
    enable = false;
  };

  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink /home/pasza/my_dotfiles/.config/zellij;
}
