{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fish
  ];

programs.fish = {
  enable = true;

  shellAliases = {
               "lg"="lazygit";

    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../../";
    "....." = "cd ../../../../";

    "dot" = "cd ~/.dotfiles";
    "stor" = "cd /storage/FTP/";

    "cp" = "cp -v";
    "ddf" = "df -h";
    "etc" = "erd -H";
    "mkdir" = "mkdir -p";
    "mv" = "mv -v";
    "rm" = "rm -v";
    "rr" = "rm -rf";

    "ld" = "eza -ld */ --no-quotes --time-style long-iso";
    "lla" = "eza -lah --no-quotes --time-style long-iso";
    "ll" = "eza -lh --no-quotes --time-style long-iso";
    "llr" = "eza -lhr --no-quotes --time-style long-iso";
    "lls" = "eza -lh -s size --no-quotes --time-style long-iso";
    "llt" = "eza -lh -s time --no-quotes --time-style long-iso";
    "lltr" = "eza -lhr -s time --no-quotes --time-style long-iso";
  };

  shellAbbrs = {
    # cargo abbreviations
    cb = "cargo build";
    cc = "cargo check";
    cdo = "cargo doc --open";
    cr = "cargo run";

    # git abbreviations
    gaa  = "git add -A";
    ga   = "git add";
    gbd  = "git branch --delete";
    gb   = "git branch";
    gc   = "git commit";
    gcm  = "git commit -m";
    gcob = "git checkout -b";
    gco  = "git checkout";
    gd   = "git diff";
    gl   = "git log";
    gp   = "git push";
    gpom = "git push origin main";
    gs   = "git status";
    gst  = "git stash";
    gstp =  "git stash pop";

    # nix abbreviations
    ncg = "nix-collect-garbage";

    nhu = "home-manager switch --flake .#pasza@nixos";
    # nhs = "home-manager switch --flake .#storage@storage";

    nrn = "sudo nixos-rebuild switch --flake .#nixos";
    # nrs = "sudo nixos-rebuild switch --flake .#storage";
  };

  functions = {

    lsr = ''
    function lsr
                  ls | rg -i $argv[1]
    end
     '';

                mkcd = ''
                function mkcd --argument name
                  mkdir -p $name
                  cd $name
                end
    '';

                yy = ''
                function yy
                  set tmp (mktemp -t "yazi-cwd.XXXXXX")
                  yazi $argv --cwd-file="$tmp"
                  if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
                    cd -- "$cwd"
                  end
                  rm -f -- "$tmp"
                end
                '';
  };
        interactiveShellInit = ''
          zoxide init fish | source
        '';
};
}
