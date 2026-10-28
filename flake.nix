{
  description = "Home Manager modules shared by all of LambTheDev's machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      homeManagerModules.default = import ./modules { inherit inputs; };

      # Build a minimal home so `nix flake check` validates the modules on
      # both platforms.
      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          home = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              inputs.self.homeManagerModules.default
              {
                home.username = "check";
                home.homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/check" else "/home/check";
                home.stateVersion = "26.05";
              }
            ];
          };
        in
        {
          home = home.activationPackage;
        }
      );
    };
}
