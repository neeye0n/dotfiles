#!/usr/bin/env bash
# setup-rgb.sh: install a systemd unit that applies a static OpenRGB profile
# at boot and after resume from sleep.
#
# Usage: sudo ./setup-rgb.sh [--uninstall]
set -euo pipefail

# ---------------------------------------------------------------- config ----
SERVICE_NAME="openrgb.service"
SERVICE_PATH="/etc/systemd/system/${SERVICE_NAME}"

# "device:RRGGBB" (index or name; check with: openrgb --list-devices)
DEVICES=(
  "0:FFFFFF"
  "1:FFFFFF"
  "2:FFFFFF"
  "3:FFFFFF"
  "6:1452FF"
)
MODE="static"
SETTLE_DELAY=3   # seconds to wait for devices to enumerate before applying
# ---------------------------------------------------------------------------

# Guard: installing a system unit requires root.
if [[ $EUID -ne 0 ]]; then
  echo "Error: run with sudo (e.g. sudo ./setup-rgb.sh)" >&2
  exit 1
fi

# Stop, disable, and delete the unit if it's already installed.
# Returns 0 if something was removed, 1 if nothing was there.
remove_existing() {
  if [[ -f "$SERVICE_PATH" ]] || systemctl list-unit-files "$SERVICE_NAME" 2>/dev/null | grep -q "$SERVICE_NAME"; then
    echo "Existing ${SERVICE_NAME} found, removing..."
    systemctl disable --now "$SERVICE_NAME" 2>/dev/null || true
    rm -f "$SERVICE_PATH"
    systemctl daemon-reload
    # Clear any failed state / start-limit history from the old copy.
    systemctl reset-failed "$SERVICE_NAME" 2>/dev/null || true
    return 0
  fi
  return 1
}

# --uninstall: remove the unit and stop, without reinstalling.
if [[ "${1:-}" == "--uninstall" ]]; then
  remove_existing || echo "${SERVICE_NAME} is not installed."
  exit 0
fi

# Find openrgb and resolve symlinks so the unit gets the real absolute path
# (systemd doesn't use your shell's PATH).
OPENRGB_BIN=$(command -v openrgb || true)
[[ -n "$OPENRGB_BIN" ]] || { echo "Error: openrgb not found in PATH." >&2; exit 1; }
OPENRGB_BIN=$(readlink -f "$OPENRGB_BIN")

# Build the ExecStart command line from the DEVICES array.
exec_args=("$OPENRGB_BIN" --config /var/lib/openrgb)
for entry in "${DEVICES[@]}"; do
  exec_args+=(-d "${entry%%:*}" -m "$MODE" -c "${entry##*:}")
done
EXEC_START=$(printf '"%s" ' "${exec_args[@]}")

# Remove any previous install so the new unit starts from a clean slate.
remove_existing || true

# Write the unit. Unquoted heredoc so ${EXEC_START} and ${SETTLE_DELAY} expand.
# - After=*.target / WantedBy=*.target: re-apply after resume from sleep.
# - Type=oneshot without RemainAfterExit: lets the unit re-run on each resume.
# - Restart=on-failure: retry (max 5 in 60s) if OpenRGB fails hard.
cat > "$SERVICE_PATH" <<EOF
[Unit]
Description=Apply static RGB profile (OpenRGB)
After=suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
StartLimitIntervalSec=60
StartLimitBurst=5

[Service]
Type=oneshot
StateDirectory=openrgb
ExecStartPre=/bin/sleep ${SETTLE_DELAY}
ExecStart=${EXEC_START}
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
EOF
chmod 644 "$SERVICE_PATH"

# Register the new unit, enable it at boot, and apply it right now.
systemctl daemon-reload
systemctl enable "$SERVICE_NAME"
systemctl restart "$SERVICE_NAME"

echo "Installed and applied ${SERVICE_NAME} (logs: journalctl -u ${SERVICE_NAME} -b)"
