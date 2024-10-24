{ config, pkgs, ... }@inputs:

let
  unstable = inputs.my-nixpkgs.from.unstable;
in
{
  home.packages = with unstable; [
    # general
    just
    pkg-config

    # nix
    nixd
    alejandra

    # go
    go_1_23
    gopls
    golangci-lint
    goimports-reviser
		gotools

    # nodejs
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server

    # ocaml
    ocamlPackages.ocamlformat
    ocamlPackages.odoc
    ocamlPackages.ocaml-lsp
    ocamlPackages.ocamlformat-rpc-lib # Nicely formatted types on hover
    ocamlPackages.utop
    dune_3

    # c
    clang-tools
    cmake
    codespell
    conan
    cppcheck
    doxygen
    gtest
    lcov
    # vcpkg
    # vcpkg-tool

    # rust
    cargo
    rustc
    rust-analyzer
  ];

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /home/pasza/my_dotfiles/.config/nvim;
}
