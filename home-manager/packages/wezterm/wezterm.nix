{ config, pkgs, ... }:

{

	home.packages = with pkgs; [
		wezterm
	];

  programs.wezterm = {
    enable = true;
  };


	# https://wezfurlong.org/wezterm/config/files.html
	
	#      the standard path under ~/.config/ 
	#     to find the config file       Where the config file is located relative to this .nix file
	#                    |                             |
	#                    V                             V
	xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;

	# To create a desktop item for a package under NixOs:
	# https://www.reddit.com/r/NixOS/comments/qhhki1/howto_create_a_package_and_provide_a_desktop_file/hictq95/

	# To create a desktop item for a package under home-manager:
	# https://www.reddit.com/r/NixOS/comments/scf0ui/how_would_i_update_desktop_file/hu5uhov/
	xdg.desktopEntries.wezterm = {
		name = "Wezterm";
		genericName = "Wezterm";
		exec = "wezterm %U";
		terminal = false; # true will pop up the system default terminal in addition to launching to program
		type = "Application";
		categories = [ "X-terminal" ];
	};	

}
