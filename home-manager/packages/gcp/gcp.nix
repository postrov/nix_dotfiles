{ config, pkgs, ... }:

let
  # since it's managed by home manager, can't install components with gcloud itself
  gcloud = pkgs.google-cloud-sdk.withExtraComponents(
    with pkgs.google-cloud-sdk.components; [
      kubectl
    ]
  );
  #gcloud = pkgs.google-cloud-sdk;
in {
  home.packages = with pkgs; [
    gcloud
    lens
  ];
}
