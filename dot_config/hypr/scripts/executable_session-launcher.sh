#!/bin/bash
noctalia msg config-set "shell.panel_anchor_bar" '"right"'
noctalia msg panel-toggle session
noctalia msg config-set "shell.panel_anchor_bar" '""'
noctalia msg config-reload
