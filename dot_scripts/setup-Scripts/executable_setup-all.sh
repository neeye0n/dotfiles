#!/usr/bin/env bash
# setup-all.sh: run every installer in this directory, in order.
#
# Usage: sudo ./setup-all.sh
set -euo pipefail

# Guard: refuse to run without root so no installer fails halfway through.
if [[ $EUID -ne 0 ]]; then
  echo "Error: run with sudo (e.g. sudo ./setup-all.sh)" >&2
  exit 1
fi

# Resolve this script's own directory so it works from any cwd.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Installers to run, in order. Append new ones here.
SCRIPTS=(
  "setup-greeter.sh"
  "setup-rgb.sh"
)

# Run each one. set -e stops the run if any installer fails.
for script in "${SCRIPTS[@]}"; do
  echo "==> ${script}"
  bash "${DIR}/${script}"
done

echo "All done."