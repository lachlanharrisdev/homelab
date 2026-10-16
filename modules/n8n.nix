{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) [ "n8n" ];

  services.n8n = {
    enable = true;

    environment = {
      GENERIC_TIMEZONE = "Australia/Sydney";
      WEBHOOK_URL = "https://n8n.lachlanharris.au";
      N8N_PROXY_HOPS = "1";
      N8N_LISTEN_ADDRESS = "127.0.0.1";
    };
  };
}
