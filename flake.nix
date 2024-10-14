{
  description = "Pasza's home"; #You can change this to whatever

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # This line makes sure that "nixpkgs.url" and "home-manager.url" stay in sync and can work together

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

 };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: # <- this `@inputs` will expose the block of code below, to the inputs that you set above.

  # This `let` statement allows you to set variables that you can use in the following block of code (hence the word `in`).
  # Setting variables here will allow you to pass them into your configuration.nix and home.nix files
  # you can use the variables here to create settings in multiple places within those files, but change them only one time here
  # Currently I am not using all the variables I have set, some are just place holders for the future.

  let
    # ---- System Settings ---- #
      system = "x86_64-linux";
      timezone = "Europe/Warsaw";
      locale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "pl_PL.UTF-8";
        LC_IDENTIFICATION = "pl_PL.UTF-8";
        LC_MEASUREMENT = "pl_PL.UTF-8";
        LC_MONETARY = "pl_PL.UTF-8";
        LC_NAME = "pl_PL.UTF-8";
        LC_NUMERIC = "pl_PL.UTF-8";
        LC_PAPER = "pl_PL.UTF-8";
        LC_TELEPHONE = "pl_PL.UTF-8";
        LC_TIME = "pl_PL.UTF-8";
      };
      nixpkgsConfig = {
        inherit system;
        config.allowUnfree = true;
      };
      my-nixpkgs.from = {
        stable = import inputs.nixpkgs nixpkgsConfig;
        unstable = import inputs.nixpkgs-unstable nixpkgsConfig;
      };
  in

{

  # This is the section of the `flake.nix` that is responsible for importing and configuring the `configuration.nix`
   nixosConfigurations = {
     nixos = nixpkgs.lib.nixosSystem {
       specialArgs = {
         # `inherit` is used to pass the variables set in the above "let" statement into our configuration.nix file below
         inherit inputs;
         inherit system;
         inherit timezone;
         inherit locale;
       };
       # Our main nixos configuration file
       # This is the file where we compartmentalize the changes we want to make on a system level
       modules = [
         ./system/nixos/configuration.nix
       ];
     };

     storage = nixpkgs.lib.nixosSystem {
       specialArgs = {
         # `inherit` is used to pass the variables set in the above "let" statement into our configuration.nix file below
         inherit inputs;
         inherit system;
         inherit timezone;
         inherit locale;
       };
       # Our main nixos configuration file
       # This is the file where we compartmentalize the changes we want to make on a system level
       modules = [
         ./system/storage/configuration.nix
       ];
     };
   };

   # home-manager configuration entrypoint
   # Available through 'home-manager --flake .
   homeConfigurations = {
     "pasza@nixos" = home-manager.lib.homeManagerConfiguration {
       pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
       extraSpecialArgs = {
         # `inherit` is used to pass the variables set in the above "let" statement into our home.nix file below
         inherit inputs;
         inherit my-nixpkgs;
       };
       # > Our main home-manager configuration file <
       modules = [
         ./home-manager/pasza/home.nix
       ];
     };

     "storage@storage" = home-manager.lib.homeManagerConfiguration {
       pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
       extraSpecialArgs = {
         # `inherit` is used to pass the variables set in the above "let" statement into our home.nix file below
         inherit inputs;
       };
       # > Our main home-manager configuration file <
       modules = [
         ./home-manager/storage/home.nix
       ];
     };
   };
 };
}
