#!/usr/bin/env zsh

if grep open /proc/acpi/button/lid/LID0/state; then
    hyprctl keyword monitor "eDP-1, preferred, auto, auto"
else 
  if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
    hyprctl keyword monitor "eDP-1, disable"
  fi
fi
