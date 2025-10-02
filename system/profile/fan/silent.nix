{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.profile.fan.silent.enable = lib.mkEnableOption "Enable fan mode 'silent' in the system";

  config = lib.mkIf config.system.profile.fan.silent.enable {
    environment.systemPackages = with pkgs; [
      (writeShellScriptBin "fan-silent" ''
        cd /sys/devices/platform/asus-nb-wmi
        sudo sh -c "echo 2 >>  fan_boost_mode"
        sudo sh -c "echo 2 >> throttle_thermal_policy"
        cd ~;
      '')
    ];
  };
}
