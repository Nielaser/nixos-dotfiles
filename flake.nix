{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.folows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86-64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
   {

      nixosConfiguration.default = nixpkgs.lib.nixosSystem {
        extraSpecialArgs = {inherit inputs;}
        modules = [
          /etc/nixos/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
