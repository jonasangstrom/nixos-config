{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { pkgs, lib, ... }:
    {
      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
      };
    };
  perSystem =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        runtimeLibs = with pkgs; [
          libxcursor
          libxrandr
          libxi
        ];
        v2-settings = true;
        settings =
          let
            noctaliaExe = pkgs.lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia;
          in
          {
            spawn-at-startup = [
              (lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia)
            ];
            input.keyboard = {
              xkb.layout = "se";
            };
            layout.gaps = 5;
            binds = {
              "Mod+R".spawn-sh = "${noctaliaExe} ipc call launcher toggle";
              "Mod+Return".spawn-sh = lib.getExe pkgs.wezterm;
              "Mod+C".close-window = { };

              "Mod+H".focus-column-left = { };
              "Mod+L".focus-column-right = { };
              "Mod+J".focus-workspace-down = { };
              "Mod+K".focus-workspace-up = { };

              "Mod+Ctrl+L".move-column-left = { };
              "Mod+Ctrl+R".move-column-right = { };
              "Mod+Ctrl+J".move-column-to-workspace-down = { };
              "Mod+Ctrl+K".move-column-to-workspace-up = { };

              "Mod+F".maximize-column = { };
              "Mod+Shift+F".fullscreen-window = { };
            };
          };
      };
    };
}
