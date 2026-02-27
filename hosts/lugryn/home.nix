{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lugryn";
  home.homeDirectory = "/home/lugryn";
    
    programs.git = {
    enable = true;
    settings.user.name = "Nielaser";
    settings.user.email = "canonville.niels@gmail.com";
    extraConfig = {
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
enable = true;
enableCompletion = true;
autosuggestion.enable = true;
syntaxHighlighting.enable = true;
sessionVariables = {
    EDITOR = "nvim";
  };
  initContent = ''
    export PATH=$HOME/.cargo/bin:$HOME/.local/bin/scripts:$HOME/.local/bin:$PATH
    eval "$(zoxide init zsh)"
    '';
shellAliases = {
ls = "exa -l";
update = "sudo nixos-rebuild switch --flake /home/lugryn/dotfiles/.";
};
history.size = 10000;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" ];
    theme = "darkblood";
  };
};

 home.packages = with pkgs; [
    atool
    httpie
    hello
    kitty
    fuzzel
    swww
    firefox
    xwayland-satellite
    wiremix
    bluetui
    gophertube
    yazi
    superfile
    nautilus
    eza
    zoxide
    waybar
    nerd-fonts.departure-mono
 ];

 home.file = {
 };

 home.stateVersion = "25.11";

 programs.home-manager.enable = true;
}
