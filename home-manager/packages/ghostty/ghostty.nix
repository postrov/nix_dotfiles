{
  config,
  pkgs,
  ...
} @ inputs: let
  unstable = inputs.my-nixpkgs.from.unstable;
in {
  home.packages = [
    unstable.ghostty
  ];
}
