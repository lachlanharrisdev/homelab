{ pkgs, ... }: {
  services.cloudflared = {
    enable = true;

    tunnels.homelab = {
      credentialsFile = "/var/lib/cloudflared/homelab.json";

      ingress = {
        "n8n.lachlanharris.au" = "http://localhost:5678";
      };

      default = "http_status:404";
    };
  };

  environment.systemPackages = [ pkgs.cloudflared ];
}
