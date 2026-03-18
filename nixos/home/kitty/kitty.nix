{lib, ...}:
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "1";
      background_blur = 0;
      font_family = "DepartureMono Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font= "auto";
      font_size = "12.5";
    };
  };
}
