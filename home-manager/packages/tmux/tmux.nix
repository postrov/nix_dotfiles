{ config, pkgs, fetchFromGitHub, ... }:
#let
#  modern-tmux-theme = mkTmuxPlugin {
#    pluginName = "modern-tmux-theme";
#    version = "unstable-2023-01-06";
#    src = fetchFromGitHub {
#      owner = "Millrocious";
#      repo = "modern-tmux-theme";
#      rev = "29dad92c8a2486e5b6f116e42883906c00a1f0a2";
#      sha256 = "sha256-ymmCI6VYvf94Ot7h2GAboTRBXPIREP+EB33+px5aaJk=";
#    };
#  };
#in
{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    prefix = "C-b";

    plugins = with pkgs; [
      # modern-tmux-theme
      tmuxPlugins.catppuccin
      tmuxPlugins.sensible
    ];

    extraConfig = ''
      set -g mouse
      unbind-key -T copy-mode-vi MouseDragEnd1Pane

      # pane movement
      #bind-key j command-prompt -p "join pane from: " "join-pane -s '%%'"
      #bind-key s command-prompt -p "send pane to: " "join-pane -t '%%'"

      set -g @catppuccin_flavour 'mocha'

      set-option -ga terminal-overrides ',xterm-256color:Tc'

      # set vi-mode
      set-window-option -g mode-keys vi
      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Make image preview work in tmux
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
    # TODO: perhaps take from variable
    set -g default-command bash
    '';
  };
}
