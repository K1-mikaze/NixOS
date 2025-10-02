{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.profile.fan.turbo.enable = lib.mkEnableOption "Enable fan mode 'turbo' in the system";

  config = lib.mkIf config.system.profile.fan.turbo.enable {
    environment.systemPackages = with pkgs; [
      (writeShellScriptBin "fan-turbo" ''
        cd /sys/devices/platform/asus-nb-wmi
        sudo sh -c "echo 1 >>  fan_boost_mode"
        sudo sh -c "echo 1 >> throttle_thermal_policy"
        cd ~;
      '')
    ];
  };
}
