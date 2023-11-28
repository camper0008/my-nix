{ pkgs, lib, ... }:

let shared_config = {
  home.stateVersion = "23.05";

  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-gtk-theme;
    };
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
        PROMPT_COLOR="\[\033[1m\[\033[44m\]\[\033[30m\]"
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
