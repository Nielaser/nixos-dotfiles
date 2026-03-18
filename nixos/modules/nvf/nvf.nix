{
  pkgs,
  lib,
  vim,
  ...
}: 
let
  sources = import ./npins;
in
{
  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        #theme = {
        #  enable = true;
        #  name = "gruvbox";
        #  style = "dark";
        #};

        viAlias = true;
        vimAlias = true;


        
        keymaps = [
          { key = "<C-i>";
            mode = [ "n" "i" "v" ];
            action = ":lua vim.diagnostic.open_float()<CR>";
            desc = "Show line diagnostic";
          }

          { key = "<C-s>";
            mode = [ "n" "i" "v" ];
            action = ":w<CR>";
            desc = "save";
          }
        ];

        startPlugins = [
          "base16"
          "colorful-menu-nvim"
          "neocord"
          "aerial-nvim"
          "which-key-nvim"
          "nvim-autopairs"
          "dashboard-nvim"
          #import with pkgs
          pkgs.vimPlugins.telescope-zoxide

        ];
        options = {
          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lsp = {
          enable = true;

        };
       languages = {
          enableFormat = true;
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
          css.enable = true;
          lua.enable = true;
          json.enable = true;
          toml.enable = true;
          qml.enable = true;
        };
      };
    };   
  };
}
