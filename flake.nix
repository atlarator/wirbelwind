{
  description = "Wirbelwind's flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    bento.url = "github:rapenne-s/bento";
    helix.url = "github:helix-editor/helix";
    microvm.url = "github:microvm-nix/microvm.nix";
    nix-search-tv.url = "github:3timeslazy/nix-search-tv";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }@inputs: {
    nixosConfigurations.wirbelwind = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ./system-packages.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.lumiere = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
        {
          nix.settings.trusted-users = [ "lumiere" ];
        }
      ];
    };
  };
}
