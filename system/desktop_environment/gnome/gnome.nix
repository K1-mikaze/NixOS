{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf config.system.desktop_environment.gnome.enable {
    environment.systemPackages = with pkgs; [
      kitty
    ];
    services.desktopManager.gnome.enable = true;

    # To disable installing GNOME's suite of applications
    # and only be left with GNOME shell.
    services.gnome.core-apps.enable = true;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];
  };
}
