{flakeConfig, ...}: {
  flake.nixosModules.server = {
    pkgs,
    flakeConfig,
    ...
  }: {
    users.users."${flakeConfig.username}".openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM+bILDKycpbpINh/2HXYTtzOag/JkdTIHxqUhOI/y/t"
    ];

    services.openssh = {
      enable = true;
      settings = {
        AllowTcpForwarding = "no";
        AllowAgentForwarding = "no";
        ClientAliveCountMax = 2;
        MaxAuthTries = 3;
        MaxSessions = 2;
        LogLevel = "VERBOSE";
        TCPKeepAlive = "no";
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };

    boot.blacklistedKernelModules = ["dccp" "sctp" "rds" "tipc" "usb_storage"];

    boot.kernel.sysctl = {
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
      "fs.suid_dumpable" = 0;
      "kernel.kptr_restrict" = 2;
      "kernel.sysrq" = 0;
      "kernel.unprivileged_bpf_disabled" = 1;
      "net.core.bpf_jit_harden" = 2;
      "net.ipv4.conf.all.log_martians" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.default.log_martians" = 1;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
    };

    security.auditd.enable = true;
    security.audit = {
      enable = true;
      rules = [
        "-a exit,always -F arch=b64 -S execve"
        "-w /etc/passwd -p wa"
        "-w /etc/shadow -p wa"
        "-w /etc/sudoers -p wa"
      ];
    };
    services = {
      logind.settings.Login = {
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
        HandleLidSwitch = "ignore";
      };
      cloudflared = {
        enable = true;
        tunnels."4a2e3c16-1f7a-49ec-82aa-a1b2567b96d0" = {
          credentialsFile = "/home/${flakeConfig.username}/.cloudflared/credentials.txt";
          ingress = {
            "ssh.yourdomain.com" = "ssh://localhost:22";
          };
          default = "http_status:404";
        };
      };
    };
  };
}
