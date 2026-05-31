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
              "Mod+J".focus-window-down = { };
              "Mod+K".focus-window-up = { };

              "Mod+Ctrl+Left".move-column-left = { };
              "Mod+Ctrl+Right".move-column-right = { };
              "Mod+Ctrl+Down".move-window-down = { };
              "Mod+Ctrl+Up".move-window-up = { };

              "Mod+Page_Down".focus-workspace-down = { };
              "Mod+Page_Up".focus-workspace-up = { };
              "Mod+Ctrl+Page_Down".move-column-to-workspace-down = { };
              "Mod+Ctrl+Page_Up".move-column-to-workspace-up = { };

              "Mod+F".maximize-column = { };
              "Mod+Shift+F".fullscreen-window = { };
            };
          };
      };
    };
}
