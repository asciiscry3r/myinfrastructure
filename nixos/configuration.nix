{ modulesPath, pkgs, lib, ... }: {

  imports = ["${modulesPath}/virtualisation/amazon-image.nix"];

  ec2.hvm = true;

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  nix.gc = {
    automatic = true;
    dates = "19:30";
  };


  networking = {
    hostName = "mksplayground";

    enableIPv6 = true;

    firewall.allowedTCPPorts = [
      22
    ];
  };

  environment.systemPackages = with pkgs; [
    git vim file screen
    docker-compose docker
  ];

  services.fail2ban.enable = true;
  services.openssh = lib.mkForce {
    enable = true;
    passwordAuthentication = false;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
}
