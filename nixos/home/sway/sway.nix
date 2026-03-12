{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      startup = [
        { command = "kitty"; }
        { command = "swww-daemon"; }
        { command = "dunst"; }
      ];
    };
  };
}
