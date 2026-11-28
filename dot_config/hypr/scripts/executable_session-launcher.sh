#!/bin/bash

exec {fd}<"$0"
flock -n "$fd" || exit 0

noctalia msg config-set "shell.panel_anchor_bar" '"right"'
noctalia msg panel-toggle session
noctalia msg config-set "shell.panel_anchor_bar" '""'
noctalia msg config-reload

sleep 0.25

