{ config, pkgs, ... }:

{

	home.packages = with pkgs; [
		htop
	];

  programs.htop = {
    enable = true;
  
  };
  
}
