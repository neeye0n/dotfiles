#!/bin/bash

noctalia msg config-set "shell.panel_anchor_bar" '"bottom"'
noctalia msg panel-toggle launcher
noctalia msg config-set "shell.panel_anchor_bar" '""'
noctalia msg config-reload
