{ self, inputs, ... }:
{
  flake.nixosModules.slaptopConfiguration =
    {
      pkgs,
      lib,
      ...
    }:
    {
      imports = [
        self.nixosModules.slaptopHardware
        self.nixosModules.niri
      ];

      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "nixos"; # Define your hostname.

      # Enable networking
      networking.networkmanager.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Set your time zone.
      time.timeZone = "Europe/Stockholm";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "sv_SE.UTF-8";
        LC_IDENTIFICATION = "sv_SE.UTF-8";
        LC_MEASUREMENT = "sv_SE.UTF-8";
        LC_MONETARY = "sv_SE.UTF-8";
        LC_NAME = "sv_SE.UTF-8";
        LC_NUMERIC = "sv_SE.UTF-8";
        LC_PAPER = "sv_SE.UTF-8";
        LC_TELEPHONE = "sv_SE.UTF-8";
        LC_TIME = "sv_SE.UTF-8";
      };

      hardware = {
        nvidia.modesetting.enable = true;
        graphics.enable32Bit = true;
      };

      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          vpl-gpu-rt
          libvdpau-va-gl
          intel-media-driver
          intel-compute-runtime
        ];
      };

      services = {
        upower.enable = true;

        displayManager.ly = {
          enable = true;
          settings = {
            bigclock = true;
            animate = true;
            animation = 0;
          };
        };
        xserver = {
          enable = true;
          xkb = {
            layout = "se";
            variant = "";
          };
          #resolutions = [{x=1920; y=1080;}];
        };
      };

      # Configure console keymap
      console.keyMap = "sv-latin1";

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      # Define a user account.
      users.users.jonas = {
        isNormalUser = true;
        description = "jonas";
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
        ];
      };

      nix.gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 15d";
      };

      nix.settings.auto-optimise-store = true;

      programs = {
        firefox.enable = true;
        fish.enable = true;
        steam.enable = true;
      };

      security.polkit.enable = true;

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = [
        inputs.nvim.packages.x86_64-linux.default
        pkgs.wl-clipboard
        pkgs.spotify
        pkgs.arduino-ide
        pkgs.htop
        pkgs.wget
        pkgs.bat
        pkgs.rofi
        pkgs.fastfetch
        pkgs.git
        pkgs.zoxide
        pkgs.starship
        pkgs.gcc
        pkgs.fzf
        pkgs.ripgrep
        pkgs.cmake
        pkgs.gnumake
        pkgs.fd
        pkgs.awww
        pkgs.waybar
        pkgs.wezterm
        pkgs.freecad-wayland
        pkgs.kdePackages.kdenlive
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.sauce-code-pro
      ];

      system.stateVersion = "24.11";
      system.autoUpgrade.enable = true;
      system.autoUpgrade.allowReboot = true;
    };

}
