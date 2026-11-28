#!/bin/bash

exec {fd}<"$0"
flock -n "$fd" || exit 0

noctalia msg config-set "shell.panel_anchor_bar" '"bottom"'
noctalia msg panel-toggle launcher

noctalia msg config-set "shell.panel_anchor_bar" '""'
noctalia msg config-reload

sleep 0.25

