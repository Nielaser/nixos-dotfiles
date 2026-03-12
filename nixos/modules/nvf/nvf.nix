{
  pkgs,
  lib,
  vim,
  ...
}: {
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


        
        maps.normal = {
          "^i" = {
            action = "lua vim.diagnostic.open_float()";
            desc = "Show line diagnostic";
          };
        };
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
          enableTreesitter = true;
          enableFormat = true;

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
