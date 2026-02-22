# NixOS config managed by chezmoi

This directory is deployed to `~/.config/nixos`.

## First-time setup commands

Run in this order:

1. `chezmoi apply`
2. `sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak`
3. `sudo nixos-rebuild dry-run --flake ~/.config/nixos#wsl`
4. `~/.local/bin/nixos-apply`
5. `nixos-option wsl.enable`
6. `nixos-option wsl.defaultUser`
7. `nixos-option system.stateVersion`

## Migration from existing /etc/nixos

1. Backup current config:
   `sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak`
2. Apply chezmoi files:
   `chezmoi apply`
3. Review `~/.config/nixos/configuration.nix` and adjust if needed.
4. Dry-run rebuild:
   `sudo nixos-rebuild dry-run --flake ~/.config/nixos#wsl`
5. Apply:
   `~/.local/bin/nixos-apply`

## Validation

- `nixos-option wsl.enable`
- `nixos-option wsl.defaultUser`
- `nixos-option system.stateVersion`

## Rollback

If rebuild fails or behavior regresses, restore the backup:
`sudo cp /etc/nixos/configuration.nix.bak /etc/nixos/configuration.nix`

## Operation rules

- Keep `/etc/nixos/configuration.nix` as backup only.
- Always use `--flake ~/.config/nixos#wsl` for rebuilds.
- Avoid running `nixos-rebuild switch` without `--flake`.

## Useful commands

- `~/.local/bin/nixos-apply`
  Apply `wsl` host from `~/.config/nixos`.
- `~/.local/bin/nixos-apply my-host`
  Apply another host entry from the flake.
- `cd ~/.config/nixos && nix flake update`
  Update pinned inputs in `flake.lock`.
