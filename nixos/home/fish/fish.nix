{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
        set fish_greeting
        zoxide init fish | source
        starship init fish | source
        set -gx PKG_CONFIG_PATH (pkg-config --variable pc_path pkg-config)

        fish_add_path $HOME/.cargo/bin
        fish_add_path $HOME/.local/bin
        fish_add_path $HOME/.local/bin/scripts

        if test -z "$NIX_LD_LIBRARY_PATH"
      set -gx NIX_LD_LIBRARY_PATH (string join ":" /run/current-system/sw/share/nix-ld/lib /run/current-system/sw/lib)
      end
    '';

    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];

    shellAliases = {
      ls = "exa -l";
      update = "sudo nixos-rebuild switch --flake ~/nixos-:dotfiles/nixos";
      cd = "z";
      add = "git add .";
      upgrade = "sudo nix flake update";
      garbage = "nix-collect-garbage --delete-older-than 3d";
      spf = "superfile";
    };
  };
}
