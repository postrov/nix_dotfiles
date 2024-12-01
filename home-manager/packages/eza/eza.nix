{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    eza
  ];

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };
}
