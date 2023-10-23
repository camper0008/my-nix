let shared_config = {
  home.stateVersion = "23.05";

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox
    ];
    extraConfig = ''
      set shiftwidth=4
      set tabstop=4
      set softtabstop=4
      set breakindent expandtab number cursorline cursorcolumn noswapfile nohlsearch undofile ignorecase smartcase termguicolors
      set wildmode=longest,list
      set mouse="a"
      set clipboard=unnamedplus
      set background=dark
      set completeopt=menuone,noselect
      set syntax=on
      colorscheme gruvbox
    '';
  };
}; in
{
  imports = [
    # added as a channel
    <home-manager/nixos>
  ];
  config = {
    home-manager.users.host = shared_config;
    home-manager.users.root = shared_config;
  };
}
