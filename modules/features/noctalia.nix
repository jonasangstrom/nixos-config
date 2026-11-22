{ self, inputs, ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia.wrap {
        inherit pkgs;
        settings = { };
      };
    };
}
