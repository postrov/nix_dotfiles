{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fish
  ];

  home.file = {
    ".bashrc" = {
      text = ''
          export PATH=''$PATH:~/bin
          if [ -z ''${BASH_EXECUTION_STRING} ] && which fish > /dev/null 2> /dev/null; then
            exec fish
          fi
      '';
    };
    ".bash_profile" = {
      text = ''
          if [ -f ~/.bashrc ];
          then
              .  ~/.bashrc;
          fi
      '';
    };
  };
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
        ls | rg -i $argv[1]
       '';
  
      mkcd = ''
        mkdir -p $argv[1]
        cd $argv[1]
      '';

      yy = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';

      fzv = {
        argumentNames = "path";
        body = ''
          if [ -n "$path" -a -d "$path" ]
              fd --type f --hidden --exclude .git --print0 . "$path"| fzf-tmux -p --read0 --print0 --exit-0 | xargs -r -0 nvim
          else
              fd --type f --hidden --exclude .git --print0 | fzf-tmux -p --read0 --print0 --exit-0 | xargs -r -0 nvim
          end
        '';
      };

      fzc = {
        argumentNames = "path";
        body = ''
          if [ -n "$path" -a -d "$path" ]
              set __TMP_CD (fd --type d --hidden --exclude .git --print0 . "$path"| fzf-tmux -p --read0 --print0 --exit-0)
          else
              set __TMP_CD (fd --type d --hidden --exclude .git --print0 | fzf-tmux -p --read0 --print0 --exit-0)
          end
          if [ -n "$__TMP_CD" ]
              cd "$__TMP_CD"
          end
        '';
      };
    };
    interactiveShellInit = ''
      zoxide init fish | source
    '';
  };
}
