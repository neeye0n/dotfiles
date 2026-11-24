#!/bin/bash

## Use first argument as output directory, or default to ~/Pictures/Screenshots
OUTPUT_DIR="${1:-$HOME/Pictures/Screenshots}"

## Expand leading tilde (~) in case Hyprland passes it literally
OUTPUT_DIR="${OUTPUT_DIR/#\~/$HOME}"

## Strip trailing slash if present to avoid double slashes
OUTPUT_DIR="${OUTPUT_DIR%/}"

## Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

## Output filename with timestamp
OUTPUT_FILE="$OUTPUT_DIR/screenshot-$(date '+%Y%m%d-%H%M%S')-satty.png"

## Determine whether to use native satty or flatpak
if command -v satty &>/dev/null; then
##   TODO: Revert/Remove GDK_BACKEND once fixed
##   Reference Issue: https://github.com/Satty-org/Satty/issues/832
    SATTY_CMD=(env GDK_BACKEND=x11 satty)
else
    SATTY_CMD=(flatpak run --env=GDK_BACKEND=x11 org.satty.Satty)
fi

## Run noctalia screenshot-region piped to Satty
noctalia msg screenshot-region \
    --freeze-screen \
    --no-save-to-file \
    --no-annotate \
    --pipe-to-command \
    --pipe-command "${SATTY_CMD[*]} --filename - --output-filename '$OUTPUT_FILE' --copy-command 'wl-copy'"
    