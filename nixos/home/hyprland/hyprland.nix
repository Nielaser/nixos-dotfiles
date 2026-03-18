{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {

    monitor = ", 1920x1200@60, auto, 1";
    exec-once = [
      "swww-daemon"
      "waybar"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      #"noctalia-shell" # Only on nix !!
      "linux-wallpaper-engine"
    ];

    env = [
      "XCURSOR_SIZE,30"
      "HYPRCURSOR_SIZE,30"
      "QS_RENDER_SOFTWARE=0"
      "QS_SCENE_DEVICE=vulkan"

    ];

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;

      resize_on_border = false;

      allow_tearing = false;

      layout = "scrolling";
    };

    cursor = {
      hide_on_key_press = true;
      inactive_timeout = 1;
    };

    decoration = {
      rounding = 20;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = false;
        size = 3;
        passes = 2;
        ignore_opacity = true;

        vibrancy = 0.1696;
      };
    };

    workspace = [
      "1, layout:scrolling"
      "2, layout:scrolling"
      "3, layout:scrolling"
      "4, layout:dwindle"
      "5, layout:dwindle"
      "6, layout:dwindle"
      "7, layout:master"
      "8, layout:monocle"
    ];

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
        "workspacesIn,  1,     1.21,  almostLinear, slide bottom"
        "workspacesOut, 1,     1.94,  almostLinear, slide bottom"
        "zoomFactor,    1,     7,     quick"
      ];
    };

    input = {
      kb_layout = "us, fr";
      kb_options = "grp:caps_toggle";
      follow_mouse = 1;
      sensitivity = 1.9;
      repeat_rate = 50;
      repeat_delay = 300;
      touchpad = {
        natural_scroll = false;
      };
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
      "SUPER, Space, exec, rofi -show drun"
      #"Super, Space, exec, noctalia-shell ipc call launcher toggle" # noctalia shell only
      "SUPER, code:24, killactive"
      "SUPER SHIFT, A, forcekillactive"
      "SUPER SHIFT, Escape, exec, wlogout"
      "SUPER, E, exec, kitty -e yazi"
      "SUPER SHIFT, E, exec, kitty -e superfile"
      "SUPER, V, togglefloating"
      "SUPER, P, pseudo, # dwindle"
      "SUPER, J, togglesplit, # dwindle"
      "SUPER Shift, F, fullscreen"
      "SUPER SHIFT, K, exec, pkill linux-wallpaper" # use for killing the wallpaper engine process if the loss of performance are to big
      "Super Shift, D, exec, vesktop"
      "Super, code:52, exec, linux-wallpaper-engine"
      "Super Shift, code:58, exec, deezer-enhanced"

      #TUI
      "SUPER, I, exec, kitty --title ConfigTUI -e impala"
      "SUPER, code:58, exec, kitty --title ConfigTUI -e wiremix"
      "SUPER, B, exec, kitty --title ConfigTUI -e bluetui"
      "SUPER Shift, W, exec,  kitty --title ConfigTUI -e wallselector"
      "Super, D, exec, kitty discordo"
      #"Super Alt, code:58, exec, kitty --title FancyCava -e cava"
      #"Super Alt, K, exec, pkill cava"

      #Move focus
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      #Switch workspaces
      "SUPER, code:10, workspace, 1"
      "SUPER, code:11, workspace, 2"
      "SUPER, code:12, workspace, 3"
      "SUPER, code:13, workspace, 4"
      "SUPER, code:14, workspace, 5"
      "SUPER, code:15, workspace, 6"
      "SUPER, code:16, workspace, 7"
      "SUPER, code:17, workspace, 8"
      "SUPER, code:18, workspace, 9"
      "SUPER, code:19, workspace, 10"

      #Move active window to ... workspace
      "SUPER SHIFT, code:10, movetoworkspace, 1"
      "SUPER SHIFT, code:11, movetoworkspace, 2"
      "SUPER SHIFT, code:12, movetoworkspace, 3"
      "SUPER SHIFT, code:13, movetoworkspace, 4"
      "SUPER SHIFT, code:14, movetoworkspace, 5"
      "SUPER SHIFT, code:15, movetoworkspace, 6"
      "SUPER SHIFT, code:16, movetoworkspace, 7"
      "SUPER SHIFT, code:17, movetoworkspace, 8"
      "SUPER SHIFT, code:18, movetoworkspace, 9"
      "SUPER SHIFT, code:19, movetoworkspace, 10"

      #Scroll workspace
      "SUPER, mouse_up, workspace, e+1"
      "SUPER, mouse_down, workspace, e-1"

      #window settings or something like that
      "Super Shift, code:21, layoutmsg, move +col"
      "Super Shift, code:20, layoutmsg, move -col"
      "Super Ctrl, code:21, layoutmsg, swapcol r"
      "Super Ctrl, code:20, layoutmsg, swapcol l"
      "Super, F, layoutmsg, fit active"

      ", Print, exec, grimblast copy area"
      "Super, Print, exec, hyprpicker -a"
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
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioStop, exec, playerctl stop"
      ",XF86AudioPrev, exec, playerctl pervious"
      ",XF86AudioNext, exec, playerctl next"

      #workspaces
      "SUPER Ctrl, code:112, movetoworkspace, e-1"
      "SUPER Ctrl, code:117, movetoworkspace, e+1"
      "Super, code:117, workspace, e+1"
      "Super, code:112, workspace, e-1"

      #resize window
      "Super Ctrl, right, resizeactive, 30 0"
      "Super Ctrl, left, resizeactive, -30 0"
      "Super Ctrl, up, resizeactive, 0 -30"
      "Super Ctrl, down, resizeactive, 0 30"
      "Super Alt, right, layoutmsg, colresize +0.1"
      "Super Alt, left, layoutmsg, colresize -0.1"

      #move window
      "Super Alt, right, moveactive, 30 0"
      "Super Alt, left, moveactive, -30 0"
      "Super Alt, up, moveactive, 0 -30"
      "Super Alt, down, moveactive, 0 30"

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
      "float yes, size 350 200, match:class zen, match:title ^Pictures in pictures$"
      "float yes, size 800 600, match:class kitty, match:title ConfigTUI"
      #"float yes, size 1000 100, no_focus yes, opacity 0.7, match:class kitty, match:title FancyCava"
    ];
  };
}
