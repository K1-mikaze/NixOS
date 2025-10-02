{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.game_mode.enable = lib.mkEnableOption "Enables Steam";

  config = lib.mkIf config.system.game_mode.enable {
    programs.steam.enable = true;

    specialisation = {
      Gaming.configuration = {
        hardware.nvidia = {
          prime.sync.enable = lib.mkForce true;
          prime.offload = {
            enable = lib.mkForce false;
            enableOffloadCmd = lib.mkForce false;
          };
        };
      };
    };
  };
}
