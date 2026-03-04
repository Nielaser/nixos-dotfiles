{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    #home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #zen-browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    #stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nvf
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #niri 
    niri = {
      url = "github:sodiboo/niri-flake";
      };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      stylix,
      nvf,
      niri,
      ...
    }@inputs:
    let
      system = "x86-64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages."x86_64-linux".default =
            (inputs.nvf.lib.neovimConfiguration {
              pkgs = nixpkgs.legacyPackages.x86_64-linux;
              modules = [ ./modules/nvf/nvf.nix ];
            }).neovim;
        
      
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          stylix.nixosModules.stylix
          ./hosts/lugryn/nixos.nix
          inputs.home-manager.nixosModules.default
          nvf.nixosModules.default
         
        ];

      };
    };
}
