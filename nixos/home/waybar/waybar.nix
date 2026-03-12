{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 10;

        "modules-left" = ["group/Utilities" "group/workspaces" "mpris"];
        "modules-center" = ["group/windows"];
        "modules-right" = ["group/tray" "custom/closebracket" "group/cpuram" "group/system"];

        "custom/openbracket" = {
          "format" = "[";
          "tooltip" = false;
        };
        "custom/closebracket" = {
          "format" = "]";
          "tooltip" = false;
        };
        "custom/split" = {
          "format" = "|";
          "tooltip" = false;
        };

        "group/tray" = {
          "orientation" = "inherit";
          "drawer" = {
            "transition" = 500;
            "click-to-reveal" = false;
            "children-class" = "not-power";
            "transition-left-to-right" = true;
          };
          "modules" = [ "custom/openbracket" "tray" ];
        };

      "group/Utilities" = {
        "orientation" = "horizontal";
        "modules" = ["custom/openbracket" "custom/nix" "custom/closebracket"];
      };
      "custom/nix" = {
        "format" = "";
        "tooltip" = false;
        "on-click" = "fuzzel";
      };

      "group/workspaces" = {
        "orientation" = "horizontal";
        "modules" = ["custom/openbracket" "hyprland/workspaces" "custom/closebracket"];
      };

      "hyprland/workspaces" = {
        "all-outputs" = true;
        "warp-on-scroll" = false;
        "enable-bar-scroll" = true;
        "disable-scroll-wraparound" = true;
        "active-only" = false;
        "format" = "{icon}";
        "format-icons" = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "default" = "•";
        };
      };

      "niri/workspaces" = {
        "format" = "{icon}";
        "format-icons" = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "default" = "•";
        };
      };

      "mpris" = {
        "format" = "[   {status_icon} | {dynamic} ]";
        "interval" = 1;
        "dynamic-len" = 40;
        "status-icons" = {
          "playing" = "▶";
          "paused" = "⏸";
          "stopped" = "";
        };
        "dynamic-order" = ["artist"];
      };

      "group/windows" = {
        "orientation" = "horizontal";
        "modules" = ["custom/openbracket" "hyprland/window" "custom/closebracket"];
      };

      "hyprland/window" = {
        "format" = "{title}";
        "max-length" = 20;
        "min-length" = 0;
        "all-outputs" = true;
      };

      "niri/window" = {
        "format" = "{title}";
        "max-length" = 20;
        "min-length" = 0;
        "all-outputs" = true;
      };

      "group/cpuram" = {
        "orientation" = "horizontal";
        "modules" = [
          "custom/openbracket"
          "cpu"
          "custom/split"
          "memory"
          "custom/closebracket"
        ];
      };
      "cpu" = {
        "format" = "CPU:{usage}%";
        "tooltip" = false;
        "interval" = 2;
        "on-click" = "kitty -e btop";
      };
      "memory" = {
        "format" = "RAM:{}%";
        "tooltip" = false;
        "interval" = 2;
        "on-click" = "kitty -e btop";
      };

      "group/brightvol" = {
        "orientation" = "horizontal";
        "modules" = [
          "custom/openbracket"
          "backlight"
          "custom/split"
          "wireplumber"
          "custom/closebracket"
        ];
      };

      "wireplumber" = {
        "scroll-step" = 5;
        "format" = "{icon}{volume}%";
        "format-bluetooth" = "{icon}{volume}% ";
        "format-bluetooth-muted" = " {icon}";
        "format-muted" = "";
        "format-icons" = {
          "headphone" = "";
          "hands-free" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = [" :" " :" " :"];
        };

        "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "on-click-right" = "pavucontrol";
      };

      "group/system" = {
        "orientation" = "horizontal";
        "modules" = [
          "custom/openbracket"
          "clock"
          "custom/split"
          "network"
          "battery"
          "custom/closebracket"
        ];
      };
      "clock" = {
        #"format": "{:%I:%M}";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "battery" = {
        "states" = {
          "warning" = 30;
          "critical" = 1;
        };
        "format" = "{icon} {capacity}%";
        "format-full" = "{icon}";
        "format-charging" = "";
        "format-plugged" = "";
        "format-icons" = ["󰂎" "󰁼" "󰁾" "󰂀" "󰁹"];
        "on-click" = "wlogout";
      };
      "idle_inhibitor" = {
        "format" = "{icon}";
        "format-icons" = {
          "activated" = "";
          "deactivated" = "";
        };
      };

      "network" = {
        "interface" = "wlan0";
        "format-wifi" = "{icon}";
        "format-ethernet" = "󰈀 LAN";
        "format-disconnected" = "󰖪";
        "on-click" = "kitty --title Impala -e impala";
        "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
      };

      "group/clock" = {
        "orientation" = "horizontal";
        "modules" = [
          "custom/openbracket"
          "clock"
          "custom/closebracket"
        ];
      };
      "tray" = {
        "icon-size" = 14;
        "spacing" = 10;
      };
      "custom/notifications" = {
        "format" = "";
        "tooltip" = false;
        "on-click" = "~/.config/waybar/scripts/notification_center.sh";
      };
    };
  };
  };
}
