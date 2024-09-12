{ config, pkgs, ... }:

{

	home.packages = with pkgs; [
    helix
	];

  programs.helix = {
    enable = true;
		defaultEditor = false;
  };

  xdg.configFile."helix/config.toml".source = ./config.toml;
  xdg.configFile."helix/languages.toml".source = ./languages.toml;
}
