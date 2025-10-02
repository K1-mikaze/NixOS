{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf config.system.desktop_environment.gnome.enable {
    environment.systemPackages = with pkgs; [
      foot
      gnomeExtensions.forge
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.removable-drive-menu
      gnomeExtensions.todo
    ];

    # To disable installing GNOME's suite of applications
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome = {
        enable = true;
      };
    };

    services.gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };

    environment.gnome.excludePackages = with pkgs; [
      baobab # disk usage analyzer
      cheese # photo booth
      epiphany # web browser
      gedit # text editor
      simple-scan # document scanner
      yelp # help viewer
      evince # document viewer
      file-roller # archive manager
      geary # email client
      seahorse # password manager

      gnome-characters
      gnome-clocks
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-photos
      gnome-screenshot
      gnome-system-monitor
      gnome-weather
      gnome-disk-utility
      gnome-connections
      gnome-terminal
      gnome-text-editor
      gnome-tour
      gnome-console
    ];
    services.xserver.excludePackages = [pkgs.xterm];

    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true; # prevents overriding
          settings = {
            "org/gnome/desktop/interface" = {
              accent-color = "orange";
            };
            "org/gnome/desktop/input-sources" = {
              xkb-options = ["caps:escape"];
              sources = [(pkgs.lib.gvariant.mkTuple ["xkb" "latam"])];
            };

            "org/gnome/shell" = {
              enabled-extensions = with pkgs.gnomeExtensions; [
                forge.extensionUuid
                clipboard-indicator.extensionUuid
                removable-drive-menu.extensionUuid
                todo.extensionUuid
              ];
            };
          };
        }
      ];
    };
  };
}
