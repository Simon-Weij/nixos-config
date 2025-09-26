touch ./system/hardware.nix
sudo nixos-generate-config --show-hardware-config > /home/simon/Documents/nixos-config/system/hardware.nix
git add -f --intent-to-add system/hardware.nix
git update-index --skip-worktree --assume-unchanged system/hardware.nix