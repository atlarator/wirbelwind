{ config, pkgs, ... }:

{
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 3500;
        enforce_domain = false;
        enable_gzip = true;

        # Alternatively, if you want to serve Grafana from a subpath:
        # domain = "your.domain";
        # root_url = "https://your.domain/grafana/";
        # serve_from_sub_path = true;
      };

      security = {
        secret_key = "$__file{/var/lib/secrets/grafana_secret_key}";
      };

      # Prevents Grafana from phoning home
      #analytics.reporting_enabled = false;
    };
  };
}
