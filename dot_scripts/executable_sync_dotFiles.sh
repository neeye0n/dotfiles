#!/bin/bash
config_dir_xdg="${XDG_CONFIG_HOME:-$HOME/.config}"
fastfetch_conf="$config_dir_xdg/fastfetch/config.jsonc"
starship_conf="$config_dir_xdg/starship.toml"

# Re-add the re-themed config to chezmoi
chezmoi re-add "$fastfetch_conf"
chezmoi re-add "$starship_conf"
chezmoi apply