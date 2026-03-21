{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
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
  #not enought buffer and /nix/store size \_•-•_/
  nix.settings.download-buffer-size = 524288000;
  systemd.services.nix-daemon.serviceConfig.LimitNOFILE = lib.mkForce 1048576;

  environment = {
    shells = [ pkgs.fish ];
    variables = {
      EDITOR = "hx";
      SYSTEMD_EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  security.polkit.enable = true;

  users.users.lugryn = {
    isNormalUser = true;
    description = "lugryn";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "uaccess"
      "video"
      "plugdeb"
    ];
    home = "/home/lugryn";
    shell = pkgs.fish;
  };

  #font
  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "DepartureMono Nerd Font Mono" ];
      sansSerif = [ "DepartureMono Nerd Font" ]; # It's a mono font, but this helps fallbacks
    };
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
    tuned.enable = true;
    upower.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  networking.wireless.enable = false;
  networking.networkmanager.enable = false;
  #networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    Ipv6 = {
      Enable = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      8002
      8003
    ];
    allowedUDPPorts = [
      8002
      8003
    ];
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
  services.xserver = {
    xkb = {
      layout = "fr, us";
      options = "grp:caps_toggle";
      variant = "";
    };

    #i3
    windowManager.i3.enable = true;
  };
  #i3
  security.pam.services.i3lock.enable = true;
  services.displayManager.defaultSession = "hyprland";

  # Configure console keymap
  #console.keyMap = "fr";
  console.useXkbConfig = true;

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
    alejandra
    nixd
    base16-schemes
    nerd-fonts.caskaydia-mono
    solaar
    electron
    playerctl
    qt6.qtdeclarative
    pkg-config
    openssl
    zlib
    glib
    inputs.caelestia-shell.packages.x86_64-linux.default
    stdenv.cc.cc
    libxml2
    libx11
    zenity
    polkit_gnome
    wineWow64Packages.stable
    libratbag
    piper
    gamescope
    app2unit
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
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
    libx11
    wayland
    libxkbcommon
    libGL
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; #Steam Remote Play
    dedicatedServer.openFirewall = true; #Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; #Steam Local Network Game Transfers
  };
  services.dbus.enable = true;
  services.dbus.packages = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gtk
  ];
  xdg.mime.defaultApplications = {
    "text/html" = "zen-browser.desktop";
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
        default = [
          "hyprland"
          "gtk"
        ];
      };
      # Specifically for Hyprland sessions
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.portal.OpenURI" = "gtk"; # Force links to use the GTK portal
      };
    };
  };

  programs.niri.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  programs.kdeconnect.enable = true;
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.package = pkgs.openrgb-with-all-plugins;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
