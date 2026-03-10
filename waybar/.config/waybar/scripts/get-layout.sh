#!/bin/bash

WS=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .activeWorkspace.id')

# Check our temp file for a runtime layout override
if [ -f /tmp/hypr_layouts ]; then
    WS_LAYOUT=$(grep "^$WS=" /tmp/hypr_layouts | tail -1 | cut -d= -f2)
fi

if [ -n "$WS_LAYOUT" ]; then
    echo "$WS_LAYOUT"
else
    hyprctl getoption general:layout -j | jq -r '.str'
fi
