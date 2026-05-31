{ self, inputs, ... }:
{
  flake.nixosConfigurations.slaptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.slaptopConfiguration
    ];
  };
}
