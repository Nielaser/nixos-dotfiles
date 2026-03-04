{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

    monitor = ", prefered, auto, 2";
    exec-once = [
      "swww-daemon"
      "waybar"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    ];

    env = [
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 11;
      border_size = 2;

      resize_on_border = false;

      allow_tearing = false;

      layout = "dwindle";
    };

    cursor = {
      hide_on_key_press = true;
      inactive_timeout = 1;
    };

    decoration = {
      rounding = 0;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 0.8;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 2;
        passes = 2;
        ignore_opacity = true;

        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = "yes, please :)";

      bezier = [
        #NAME,           X0,   Y0,   X1,   Y1
        "easeOutQuint,   0.23, 1,    0.32, 1"
        "easeInOutCubic, 0.65, 0.05, 0.36, 1"
        "linear,         0,    0,    1,    1"
        "almostLinear,   0.5,  0.5,  0.75, 1"
        "quick,          0.15, 0,    0.1,  1"
      ];

      animation = [
        #NAME,          ONOFF, SPEED, CURVE,        [STYLE]
        "global,        1,     10,    default"
        "border,        1,     5.39,  easeOutQuint"
        "windows,       1,     4.79,  easeOutQuint"
        "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
        "windowsOut,    1,     1.49,  linear,       popin 87%"
        "fadeIn,        1,     1.73,  almostLinear"
        "fadeOut,       1,     1.46,  almostLinear"
        "fade,          1,     3.03,  quick"
        "layers,        1,     3.81,  easeOutQuint"
        "layersIn,      1,     4,     easeOutQuint, fade"
        "layersOut,     1,     1.5,   linear,       fade"
        "fadeLayersIn,  1,     1.79,  almostLinear"
        "fadeLayersOut, 1,     1.39,  almostLinear"
        "workspaces,    1,     1.94,  almostLinear, slide"
        "workspacesIn,  1,     1.21,  almostLinear, slide"
        "workspacesOut, 1,     1.94,  almostLinear, slide"
        "zoomFactor,    1,     7,     quick"
      ];
    };

    input = {
      kb_layout = "fr";
      follow_mouse = 1;
      sensitivity = 1.9;

      touchpad = {
        natural_scroll = false;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = false;
    };

    bind = [
      "SUPER, Return, exec, kitty"
      "SUPER, Space, exec, fuzzel"
      "SUPER, A, killactive"
      "SUPER SHIFT, A, forcekillactive"
      "SUPER SHIFT, Escape, exec, wlogout"
      "SUPER, E, exec, kitty -e yazi"
      "SUPER SHIFT, E, exec, kitty -e superfile"
      "SUPER, V, togglefloating"
      "SUPER, P, pseudo, # dwindle"
      "SUPER, J, togglesplit, # dwindle"
      "SUPER, F, fullscreen"

      #TUI
      "SUPER, I, exec, kitty --title ConfigTUI -e impala"
      "SUPER, M, exec, kitty --title ConfigTUI -e wiremix"
      "SUPER, B, exec, kitty --title ConfigTUI -e bluetui"

      #Move focus
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      #Switch workspaces
      "SUPER, Ampersand, workspace, 1"
      "SUPER, Eacute, workspace, 2"
      "SUPER, Quotedbl, workspace, 3"
      "SUPER, Apostrophe, workspace, 4"
      "SUPER, ParenLeft, workspace, 5"
      "SUPER, Minus, workspace, 6"
      "SUPER, Egrave, workspace, 7"
      "SUPER, Underscore, workspace, 8"
      "SUPER, Ccedilla, workspace, 9"
      "SUPER, Agrave, workspace, 10"

      #Move active window to ... workspace
      "SUPER SHIFT, Ampersand, movetoworkspace, 1"
      "SUPER SHIFT, Eacute, movetoworkspace, 2"
      "SUPER SHIFT, Quotedbl, movetoworkspace, 3"
      "SUPER SHIFT, Apostrophe, movetoworkspace, 4"
      "SUPER SHIFT, ParenLeft, movetoworkspace, 5"
      "SUPER SHIFT, Minus, movetoworkspace, 6"
      "SUPER SHIFT, Egrave, movetoworkspace, 7"
      "SUPER SHIFT, Underscore, movetoworkspace, 8"
      "SUPER SHIFT, Ccedilla, movetoworkspace, 9"
      "SUPER SHIFT, Agrave, movetoworkspace, 10"

      #Scroll workspace
      "SUPER, mouse_up, workspace, e+1"
      "SUPER, mouse_down, workspace, e-1"

      ", Print, exec, grimblast copy area"
    ];

    bindm = [
      #Move/resize window
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      #Require playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl previous"
    ];

    windowrule = [
      "float yes, move 20 monitor_h-120, match:class hyprland-run"
      "float yes, size 350 200, match:class zen, match:title ^Pictures-in-Pictures$"
      "float yes, size 800 600, match:class kitty, match:title ConfigTUI"
    ];
  };
}
