{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor = {
        scrolloff = 5;
        mouse = true;
        middle-click-paste = true;
        shell = [
          "sh"
          "-c"
        ];
        line-number = "relative";
        continue-comments = true;
        auto-completion = true;
        path-completion = true;
        auto-format = true;
        bufferline = "multiple";
      };

      keys.normal =  {
          "C-s" = ":w";
        };

      keys.insert = {
          "C-s" = ":w";
        };

    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
  };
}
