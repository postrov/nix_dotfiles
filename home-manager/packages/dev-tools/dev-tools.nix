{ config, pkgs, ... }@inputs:

let
  unstable = inputs.my-nixpkgs.from.unstable;
in
{
  home.packages = with unstable; [
    # c
    clang
    clang-tools
    cmake
    codespell
    conan
    cppcheck
    doxygen
    gtest
    lcov
    gnumake
    # vcpkg
    # vcpkg-tool

    # general
    just
    pkg-config

    # go
    go_1_23
    gopls
    golangci-lint
    goimports-reviser
		gotools

    # json
    jq

    # lua
    lua
    lua-language-server

    # nix
    nixd
    alejandra

    # nodejs
    nodejs
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
    emmet-language-server

    # ocaml
    ocamlPackages.ocamlformat
    ocamlPackages.odoc
    ocamlPackages.ocaml-lsp
    ocamlPackages.ocamlformat-rpc-lib # Nicely formatted types on hover
    ocamlPackages.utop
    dune_3

    # python
    python3
    mypy
    pyright
    ruff

    # rust
    rustc
    rust-analyzer
    clippy
    cargo
  ];

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink /home/pasza/my_dotfiles/.config/nvim;
}
