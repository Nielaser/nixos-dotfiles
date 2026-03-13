{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/screenshots/screenshot from %Y-%m-%d %H-%M-%S.png";

      spawn-at-startup = [
        {argv = ["waybar"];}
        {sh = "swww-daemon";}
        #       { sh = "noctalia-shell"; }
      ];

      workspaces = {
        "chat" = {
          name = "chat";
        };

        "games" = {
          name = "games";
        };
      };

      input = {
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "10%";
        };
        keyboard = {
          numlock = false;
          repeat-delay = 300;
          repeat-rate = 40;
          xkb = {
            layout = "fr, us";
          };
        };

        touchpad = {
          tap = true;
          natural-scroll = true;
        };
      };

      layout = {
        border = {
          enable = false;
          width = 2;
          active.color = "#${config.lib.stylix.colors.base0D}";
          inactive.color = "#${config.lib.stylix.colors.base01}";
        };

        focus-ring = {
          enable = false;
          width = 4;
        };

        default-column-width = {
          proportion = 0.6;
        };

        gaps = 8;
      };

      window-rules = [
        {
          matches = [ { title = "ConfigTUI"; } ];
          default-column-width.fixed = 800;
          default-window-height.fixed = 500;
          open-floating = true;
          open-focused = true;
        }

        {
          geometry-corner-radius = {
            bottom-left = 10.0;
            bottom-right = 10.0;
            top-left = 10.0;
            top-right = 10.0;
          };
          clip-to-geometry = true;
        }

        {
          matches = [ { title = "Picture in picture"; } ];
          open-floating = true;
          open-focused = false;
        }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+Shift+Colon".action = show-hotkey-overlay;
        "Mod+Return".action.spawn = "kitty";
        #"Mod+Space".action.spawn = "fuzzel";
        "Mod+Space".action.spawn-sh = "noctalia-shell ipc call launcher toggle"; # noctali only
        "Mod+Alt+L".action.spawn = "swaylock";

        #"Mod+Shift+W".action.spawn-sh = "kitty --title ConfigTUI -e wallselector";
        "Mod+SHift+W".action.spawn-sh = "noctalia-shell ipc call wallpaper toggle";
        "Mod+E".action.spawn-sh = "kitty -e yazi";
        "Mod+Alt+E".action.spawn = "nautilus";
        "Mod+D".action.spawn-sh = "kitty -e discordo";
        "Mod+Shift+D".action.spawn-sh = "vesktop";
        "Mod+M".action.spawn-sh = "kitty --title ConfigTUI -e wiremix";
        "Mod+I".action.spawn-sh = "kitty --title ConfigTUI -e impala";
        "Mod+B".action.spawn-sh = "kitty --title ConfigTUI - bluetui";

        "XF86AudioRaiseVolume" = {
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
          allow-when-locked = true;
        };

        "XF86AudioLowerVolume" = {
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          allow-when-locked = true;
        };

        "XF86AudioMute" = {
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toogle";
          allow-when-locked = true;
        };

        "XF86AudioMicMute" = {
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          allow-when-locked = true;
        };

        "XF86AudioPlay" = {
          action = spawn-sh "playerctl play-pause";
          allow-when-locked = true;
        };

        "XF86AudioStop" = {
          action = spawn-sh "playerctl stop";
          allow-when-locked = true;
        };

        "XF86AudioPrev" = {
          action = spawn-sh "playerctl previous";
          allow-when-locked = true;
        };

        "XF86AudioNext" = {
          action = spawn-sh " playerctl next";
          allow-when-locked = true;
        };

        "XF86MonBrightnessUp" = {
          action = spawn-sh "brightnessctl set +10%";
          allow-when-locked = true;
        };

        "XF86MonBrightnessDown" = {
          action = spawn-sh "brightnessctl set 10%-";
          allow-when-locked = true;
        };

        "Mod+O" = {
          repeat = false;
          action = toggle-overview;
        };

        "Mod+A" = {
          repeat = false;
          action = close-window;
        };

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        "Mod+Page_Down".action = focus-workspace-down;
        "Mod+Page_Up".action = focus-workspace-up;
        "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
        "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
        "Mod+Shift+Page_Down".action = move-workspace-down;
        "Mod+Shift+Page_Up".action = move-workspace-up;

        "Mod+Ampersand".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+Quotedbl".action.focus-workspace = 3;
        "Mod+Apostrophe".action.focus-workspace = 4;
        "Mod+ParenLeft".action.focus-workspace = 5;
        "Mod+Minus".action.focus-workspace = 6;
        "Mod+Egrave".action.focus-workspace = 7;
        "Mod+Underscore".action.focus-workspace = 8;
        "Mod+Ccedilla".action.focus-workspace = 9;
        "Mod+Ctrl+Ampersand".action.move-column-to-workspace = 1;
        "Mod+Ctrl+2".action.move-column-to-workspace = 2;
        "Mod+Ctrl+Quotedbl".action.move-column-to-workspace = 3;
        "Mod+Ctrl+Apostrophe".action.move-column-to-workspace = 4;
        "Mod+Ctrl+ParenLeft".action.move-column-to-workspace = 5;
        "Mod+Ctrl+Minus".action.move-column-to-workspace = 6;
        "Mod+Ctrl+Egrave".action.move-column-to-workspace = 7;
        "Mod+Ctrl+Underscore".action.move-column-to-workspace = 8;
        "Mod+Ctrl+Ccedilla".action.move-column-to-workspace = 9;

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;

        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+Ctrl+F".action = expand-column-to-available-width;

        "Mod+C".action = center-column;

        "Mod+Ctrl+C".action = center-visible-columns;

        "Mod+ParenRight".action.set-column-width = "-5%";
        "Mod+Equal".action.set-column-width = "+5%";

        "Mod+Shift+ParenRight".action.set-window-height = "-5%";
        "Mod+Shift+Equal".action.set-window-height = "+5%";

        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Mod+W".action = toggle-column-tabbed-display;

        "Print".action.screenshot = {
          show-pointer = false;
        };
        "Ctrl+Print".action.screenshot-screen = {
          show-pointer = false;
        };

        "Mod+Escape" = {
          allow-inhibiting = false;
          action = toggle-keyboard-shortcuts-inhibit;
        };

        "Mod+Shift+Escape".action = quit;
        "Ctrl+Alt+Delete".action = quit;

        "Mod+Shift+P".action = power-off-monitors;
      };
    };
  };
}
