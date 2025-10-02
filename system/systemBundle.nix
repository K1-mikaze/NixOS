{
  imports = [
    ./profile/battery/set60.nix
    ./profile/battery/set90.nix
    ./profile/fan/turbo.nix
    ./profile/fan/silent.nix
    ./profile/fan/performance.nix
    ./desktop_environment/hyprland/hyprland.nix
    ./desktop_environment/gnome/gnome.nix
    ./hardware/hardware-configuration.nix
    ./hardware/videoGraphic.nix
    ./shell/zsh.nix
    ./game_mode/game_mode.nix
  ];
}
