#!/usr/bin/env bash
# install-greeter-config.sh: (re)create the noctalia greeter config,
# replacing any existing greeter.toml.
#
# Usage: sudo ./setup-greeter.sh
set -euo pipefail

# ---------------------------------------------------------------- config ----
GREETER_DIR="/var/lib/noctalia-greeter"
GREETER_CONF="${GREETER_DIR}/greeter.toml"
GREETER_OWNER=""   # e.g. "greeter:greeter"; leave empty to keep root ownership
# ---------------------------------------------------------------------------

# Guard: writing to /var/lib requires root.
if [[ $EUID -ne 0 ]]; then
  echo "Error: run with sudo (e.g. sudo ./setup-greeter.sh)" >&2
  exit 1
fi

# Note when an existing config is about to be overwritten.
[[ -f "$GREETER_CONF" ]] && echo "Existing ${GREETER_CONF} found, replacing..."

# Create the directory if it doesn't exist yet.
install -d -m 755 "$GREETER_DIR"

# Write to a temp file first, then install it in one step,
# so a half-written config never ends up in place.
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

# Quoted heredoc: the TOML is written literally, with no shell expansion.
cat > "$tmp" <<'EOF'
[session]
default="hyprland"

[user]
default="neon"

[appearance]
hide_logo=true
password_style="random"
scheme_selector_position="hidden"

[clock]
enabled=false
EOF
install -m 644 "$tmp" "$GREETER_CONF"

# Optionally hand the file to the greeter's service account.
[[ -z "$GREETER_OWNER" ]] || chown "$GREETER_OWNER" "$GREETER_CONF"

echo "Wrote ${GREETER_CONF}"