{ config, pkgs, ... }:

{
  systemd.user.services.restic-backup = {
    description = "Restic system backup on mechabackup";
    serviceConfig = {
      Type = "oneshot"; # Changed to oneshot since it's a recurring task
      ExecStart = "/run/current-system/sw/bin/restic backup /home/lumiere -r /mechabackup/";
    };
  };

  systemd.user.timers.restic-backup = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 03:00:00";
      Persistent = true;
      Unit = "restic-backup.service";
    };
  };
}
