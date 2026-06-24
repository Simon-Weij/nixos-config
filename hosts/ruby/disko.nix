{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/mmc-DA4064_0x30d5291c";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            swap = {
              size = "2G";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                  "@root" = {
                    mountpoint = "/";
                    mountOptions = ["compress=zstd" "noatime"];
                  };

                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = ["compress=zstd" "noatime"];
                  };

                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                  "@snapshots" = {
                    mountpoint = "/.snapshots";
                    mountOptions = ["compress=zstd" "noatime"];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
  # ls -l /dev/disk/by-id
  # sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount --flake /home/nixos/Documents/nixos-config#ruby
  # sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode mount --flake /home/nixos/Documents/nixos-config#ruby
  # cd /mnt
  # nixos-generate-config --root /tmp/config --no-filesystems
  # mv /tmp/config/etc/nixos/hardware-configuration.nix /home/nixos/Documents/nixos-config/modules/hosts/onyx/hardware.nix
  # nix-shell -p git
  # cd /home/nixos/Documents/nixos-config
  # git add .
  # sudo mkdir -p /mnt/home/simon/Documents/nixos-config
  # sudo cp -r /home/nixos/Documents/nixos-config /mnt/home/simon/Documents/nixos-config
  # sudo nixos-install --flake /home/nixos/Documents/nixos-config#onyx --root /mnt --no-root-passwd

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = ["/"];
  };
}
