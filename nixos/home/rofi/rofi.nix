{
  lib,
  pkgs,
  config,
  ...
}: {
  programs.rofi = {
    enable = true;
    font = lib.mkForce "DepartureMono Nerd Font Mono";
    modes = ["drun" "run" "window" "ssh"];
    extraConfig = {
      show-icons = true;
    };

    theme = {
      inputbar = {
        margin = 10;
      };
    };
  };
}
