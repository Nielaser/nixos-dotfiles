{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../stylix/stylix.nix
    ../../modules/nvf/nvf.nix
    ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";

    extraSpecialArgs = { inherit inputs; };

    users.lugryn = import ../../home/home.nix;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  environment = {
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "vim";
      SYSTEMD_EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  users.users.lugryn = {
    isNormalUser = true;
    description = "lugryn";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    home = "/home/lugryn";
    shell = pkgs.fish;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome.core-apps.enable = false;
    gnome.core-developer-tools.enable = false;
    gnome.games.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];


  networking.wireless.enable = false;
  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    Ipv6 = {
      Enable = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    zsh
    brightnessctl
    gcc
    cmake
    pkg-config
    libffi
    cargo
    rustc
    go
    python3
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    alejandra
    nixd
    base16-schemes
    nerd-fonts.caskaydia-mono
    solaar
    electron
    playerctl
    pkg-config
    openssl
    zlib
    glib
    stdenv.cc.cc
    libxml2
    libx11
    zenity
    polkit_gnome
    wineWow64Packages.stable
  ];
security.polkit.enable = true;
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
  description = "polkit-gnome-authentication-agent-1";
  wantedBy = ["graphical-session.target"];
  wants = ["graphical-session.target"];
  after = ["graphical-session.target"];
  serviceConfig = {
    Type = "simple";
    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Restart = "on-failure";
    RestartSec = 1;
    TimeoutStopSec = 10;
  };
};


  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    openssl
    glib
    stdenv.cc.cc
    libtiff
    libjpeg
    libpng
    libffi
    fontconfig
    freetype
    xorg.libX11
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
services.dbus.enable = true;
services.dbus.packages = [ 
  pkgs.xdg-desktop-portal-hyprland
  pkgs.xdg-desktop-portal-gtk 
];
xdg.mime.defaultApplications = {
  "text/html" = "zen-browser.desktop"; # or google-chrome.desktop, etc.
  "x-scheme-handler/http" = "zen-browser.desktop";
  "x-scheme-handler/https" = "zen-browser.desktop";
};

xdg.portal = {
  enable = true;
  extraPortals = [ 
     pkgs.xdg-desktop-portal-gtk 
  ];
  # This tells the portal exactly which backend to use for what
  config = {
    common = {
      default = [ "hyprland" "gtk" ];
    };
    # Specifically for Hyprland sessions
    hyprland = {
      default = [ "hyprland" "gtk" ];
      "org.freedesktop.portal.OpenURI" = "gtk"; # Force links to use the GTK portal
    };
  };
};

  programs.niri.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
