{ ... }: {
  imports = [
    ./hardware-conf.nix
    ./disko.nix
    ../../modules/base.nix
    ../../modules/docker.nix
    ../../modules/amp.nix
  ];
}
