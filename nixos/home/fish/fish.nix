{ pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
      starship init fish | source
      '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];

    shellAliases = {
      ls="exa -l";
      update="sudo nixos-rebuild switch --flake ~/dotfiles/nixos";
      cd="z";
      add = "git add ~/dotfiles";
    };
  };
}
