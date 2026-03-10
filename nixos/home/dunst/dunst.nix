{pkgs, config, lib, ...}: {
  services.dunst = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    settings = {
      global = lib.mkForce {
        monitor = 0;
        follow = "none";
        width = 400;
        height = 400;
        origin = "top-left";
        offset = "10x20";
        scale = 0;
        notification_limit = 4;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 4;
        frame_width = 2;
        sort = "yes";
        font = "DepartureMono Nerd Font Mono";
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 30;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicate = "true";
        hide_duplicate_count = false;
        show_indicator = "yes";
        icon_position = "left";
        min_icon_size = 0;
        max_icon_size = 32;
        sticky_history = "yes";
        history_length = 20;
        browser = "${pkgs.xdg-utils}/bin/xdg-open";
        always_run_scripts = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 0;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
        separator_color = "frame";
        icon_path = "";
        frame_color = "#${config.lib.stylix.colors.base0D}";
        highlight = "#${config.lib.stylix.colors.base01}";
      };

      #urgency_low = {
        #timeout = 3;
        #background = "#${config.lib.stylix.colors.base00}";
        #foreground = "#${config.lib.stylix.colors.base05}";
        #highlight = "#${config.lib.stylix.colors.base06}";
        #};

      #urgency_normal = {
        #timeout = 6;
        #background = "#${config.lib.stylix.colors.base00}";
        #foreground = "#${config.lib.stylix.colors.base05}";
        #highlight = "#${config.lib.stylix.colors.base06}";
        #};

      #urgency_critical = {
        #timeout = 12;
        #background = "#${config.lib.stylix.colors.base00}";
        #foreground = "#${config.lib.stylix.colors.base05}";
        #highlight = "#${config.lib.stylix.colors.base06}";
        #};
    };
  };
}
