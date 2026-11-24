# #!/bin/bash

# usage: workspace.sh next|prev
DIR="${1:-next}"
[[ $DIR == next || $DIR == prev ]] || { echo "usage: $0 next|prev" >&2; exit 1; }

CURRENT_ID=$(hyprctl activeworkspace -j | jq -r '.id')

# Existing regular workspaces (persistent empty ones included), ascending
WORKSPACES_JSON=$(hyprctl workspaces -j)
mapfile -t IDS < <(jq -r '.[].id | select(. >= 1)' <<< "$WORKSPACES_JSON" | sort -n)

TARGET=""

if [[ $DIR == next ]]; then
    for id in "${IDS[@]}"; do
        (( id > CURRENT_ID )) && { TARGET=$id; break; }
    done
    # nothing above: create the next one
    [[ -z $TARGET ]] && TARGET=$((CURRENT_ID + 1))
else
    for id in "${IDS[@]}"; do
        (( id < CURRENT_ID )) && TARGET=$id
    done
    # nothing below: wrap to the highest workspace that has windows
    if [[ -z $TARGET ]]; then
        TARGET=$(jq -r '.[] | select(.id >= 1 and .windows > 0) | .id' <<< "$WORKSPACES_JSON" | sort -n | tail -1)
        # no occupied workspace anywhere, or it's the one we're on: stay put
        [[ -z $TARGET || $TARGET == "$CURRENT_ID" ]] && exit 0
    fi
fi

hyprctl dispatch "hl.dsp.focus({ workspace = $TARGET })"
