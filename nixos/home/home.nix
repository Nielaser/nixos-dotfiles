{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hyprland/hyprland.nix
    ../pkgs/pkgs.nix
    ./kitty/kitty.nix
    ./waybar/waybar.nix
    ./waybar/style.nix
    ./niri/niri.nix
    ./dunst/dunst.nix
    ./fuzzel/fuzzel.nix
    ./fish/fish.nix
    ./sway/sway.nix
    ./helix/helix.nix
    ./dms/dms.nix
    #./caelestiashell/cealestia.nix
    #inputs.caelestia-shell.homeManagerModules.default
  ];

  home.file = {
    "Pictures/Wallpapers" = {
      source = inputs.gruvbox-wallpapers.packages."${pkgs.stdenv.hostPlatform.system}".default;
      recursive = true;
    };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lugryn";
  home.homeDirectory = "/home/lugryn";

  programs.git = {
    enable = true;
    settings = {
      user.name = "Nielaser";
      user.email = "randommail@random";
      init.defaultBranch = "main";
    };
  };

  programs.bash = {
    enable = false;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch";
    };
  };

  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      MANPAGER = "most";
    };
    initContent = ''
      export PATH=$HOME/.cargo/bin:$HOME/.local/bin/scripts:$HOME/.local/bin:$PATH
      eval "$(zoxide init zsh)"
    '';

    shellAliases = {
      ls = "exa -l";
      update = "sudo nixos-rebuild switch --flake /home/lugryn/dotfiles/nixos/.";
      add = "git add ~/dotfiles/";

    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "darkblood";
    };
  };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  home.file = {
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
