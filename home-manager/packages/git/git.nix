{ config, pkgs, ... }:

{

	home.packages = with pkgs; [
		git
	];

	programs.git = {
	  enable = true;
	  userName = "Paweł Ostrowski";
	  extraConfig = {
		  credential.helper = "libsecret";
	  };
	};
}
