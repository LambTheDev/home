{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [
      pkgs.vimPlugins.conform-nvim
      pkgs.vimPlugins.nvim-lspconfig
    ];
    # On nvim's PATH, so the Lua config calls them by name. nixd formats
    # through nixfmt.
    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt
      pkgs.prettier
    ];
    initLua = ''
      require("lamb")
    '';
  };

  xdg.configFile."nvim/lua/lamb".source = ../config/nvim/lua/lamb;
}
