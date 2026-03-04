{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    settings = {
      binds = with config.lib.niri.actions; {
        "Mod+Shift+Colon".action = show-hotkey-overlay ;
        "Mod+Return".action.spawn = "kitty";
        "Mod+Space".action.spawn = "fuzzel";
        "Mod+Alt+L".action.spawn = "swaylock";

        "Mod+E".action.spawn-sh = "kitty -e yazi";
        "Mod+Alt+E".action.spawn = "nautilus";
        "Mod+Alt+D".action.spawn-sh = "kitty -e discordo";
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
          action = spawn "brightnessctl --class=blacklight set +10%";
          allow-when-locked = true;
          };

        "XF86MonBrightnessDown" = {
          action = spawn "brightnessctl --class=backlight set 10%-";
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
        "Mod+UP".action = focus-window-up;

    };
  };
};
}
