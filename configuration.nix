{lib, ...}: {
  imports = [
    ./system/systemBundle.nix
    ./database/databaseBundle.nix
    ./tool/toolBundle.nix
  ];

  nixpkgs.config.allowUnfree = true;

  system = {
    desktop_environment.hyprland.enable = true;
    game_mode.enable = true;

    shell = {
      zsh.enable = true;
    };

    profile = {
      battery = {
        set60.enable = true;
        set90.enable = true;
      };

      fan = {
        silent.enable = true;
        turbo.enable = true;
        performance.enable = true;
      };
    };
  };

  database = {
    mysql.enable = true;
    sqlite.enable = false;
    postgresql.enable = true;
  };

  tool = {
    tomcat.enable = true;
    docker.enable = false;
    nginx.enable = false;
    virt-manager.enable = false;
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable sound with pipewire.
  security.rtkit.enable = true;

  users.users.k1 = {
    isNormalUser = true;
    description = "K1";
    extraGroups = ["networkmanager" "wheel" "video"];
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
