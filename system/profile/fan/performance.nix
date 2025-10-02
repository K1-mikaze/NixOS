{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.profile.fan.performance.enable = lib.mkEnableOption "Enable fan mode 'performance' in the system";

  config = lib.mkIf config.system.profile.fan.performance.enable {
    environment.systemPackages = with pkgs; [
      (writeShellScriptBin "fan-performance" ''
        cd /sys/devices/platform/asus-nb-wmi
        sudo sh -c "echo 0 >>  fan_boost_mode"
        sudo sh -c "echo 0 >> throttle_thermal_policy"
        cd ~;
      '')
    ];
  };
}
