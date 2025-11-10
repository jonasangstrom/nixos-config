{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvim.url = "github:jonasangstrom/nixvim";
  };

  outputs = { nixpkgs, nvim, ... } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "X86_64-linux";
      modules = [
        ./hosts/slaptop/configuration.nix
      ];
      specialArgs = {inherit nvim;};
    };
  };
}
