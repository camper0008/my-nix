{ pkgs, lib, ... }:

let shared_config = {
  home.stateVersion = "23.05";

  xfconf.settings = {
    xsettings = {
      "Net/ThemeName" = "Gruvbox-Dark-BL";
      "Net/IconThemeName" = "Gruvbox-Plus-Dark";
      "Gtk/CursorThemeName" = "Capitaine Cursors (Gruvbox)";
    };
    xfce4-keyboard-shortcuts = {
      "commands/custom/<Super>Return" = "exo-open --launch TerminalEmulator";
      "commands/custom/<Super>s" = "xfce4-appfinder";
    };
    xfwm4 = {
      "general/theme" = "Gruvbox-Dark-BL";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  programs.gpg.enable = true;

  programs.bash = {
    enable = true;
    bashrcExtra = ''
        # If not running interactively, don't do anything
        [[ $- != *i* ]] && return
        PROMPT_COLOR="\[\033[1m\[\033[43m\]\[\033[30m\]"
        CLEAR_COLOR="\[\033[0m\]"

        PS1=$CLEAR_COLOR'\u '$PROMPT_COLOR' $(prompt-shortener) '$CLEAR_COLOR' \$ '

        # aliases
        alias docker="sudo docker"
        alias docker-compose="sudo docker-compose"

        export EDITOR="nvim"
        alias cat="bat"
        alias ls="exa"
        alias rls="clear && exa"
        alias bs="nixos-rebuild switch"
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.dynamic_title = true;
      colors = {
        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
    };
  };

  services.gpg-agent.enable = true;

  programs.git = {
    enable = true;
    userName  = "Theis Pieter Hollebeek";
    userEmail = "tphollebeek@gmail.com";
  };

  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };
};
in
{
  imports = [
    # added as a channel
    <home-manager/nixos>
  ];

  config = {

    programs.steam.enable = true;
    
    home-manager.useGlobalPkgs = true;
    home-manager.users.pieter = shared_config;
    home-manager.users.root = shared_config;
  };
}
