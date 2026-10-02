{ pkgs, ... }: {
  networking.hostName = "homelab";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.openssh = {
    enable = true;
    settings = { PasswordAuthentication = false; PermitRootLogin = "no"; };
  };

  users.users.lachlan = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKEiEBPEbc2jt3Z82ppOifWEJxHLGrYoD36ZyzhlpR00 contact@lachlanharris.au" ];
  };
  security.sudo.wheelNeedsPassword = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [ git vim htop gh ];

  programs.git = {
    enable = true;
    config = {
      user.name = "Lachlan Harris";
      user.email = "contact@lachlanharris.au";
      init.defaultBranch = "main";
    };
  };
  system.stateVersion = "26.05";
}
