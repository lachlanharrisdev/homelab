{ ... }: {
  users.users.lachlan.uid = 1000;

  systemd.tmpfiles.rules = [
    "d /srv/data/amp 0755 lachlan users -"
  ];

  virtualisation.oci-containers.containers.amp = {
    image = "mitchtalmadge/amp-dockerized:latest";
    autoStart = true;

    environment = {
      UID = "1000";
      GID = "100";
      TZ = "Australia/Sydney";
      USERNAME = "admin";
      AMP_AUTO_UPDATE = "true";
    };

    volumes = [ "/srv/data/amp:/home/amp" ];

    ports = [
      "8080:8080/tcp"            # web ui
      "25565:25565/tcp"          # mc
      "25565:25565/udp"
    ];

    extraOptions = [
      "--mac-address=02:42:AC:99:D4:C4"
    ];
  };
}
