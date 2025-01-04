{
  config,
  pkgs,
  ...
} @ inputs: let
  unstable = inputs.my-nixpkgs.from.unstable;
in {
  home.packages = with pkgs; [
    unstable.emacs
  ];

  programs.emacs = {
    enable = false;
    # defaultEditor = true;
  };

  xdg.configFile."emacs".source = config.lib.file.mkOutOfStoreSymlink /home/pasza/my_dotfiles/.config/emacs_new;
}
