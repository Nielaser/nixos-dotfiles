{pkgs, config, lib, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = lib.mkForce {
        font = "DepartureMono Nerd Font Mono";
        terminal = "${pkgs.kitty}/bin/kitty";
      };
      #colors = {
      # background = "#${config.lib.stylix.colors.base00}";
      # text = "#${config.lib.stylix.colors.base05}";
      # prompt = "#${config.lib.stylix.colors.base05}";
      # placeholder = "#${config.lib.stylix.colors.base06}";
      # input = "#${config.lib.stylix.colors.base07}";
      # match = "#${config.lib.stylix.colors.base0D}";
      # selection = "#${config.lib.stylix.colors.base01}";
      # selection-text = "#${config.lib.stylix.colors.base03}";
      # selection-match = "#${config.lib.stylix.colors.base02}";
      # counter = "#${config.lib.stylix.colors.base0B}";
      # border = "#${config.lib.stylix.colors.base0D}";
      #};
    };
  };

}
