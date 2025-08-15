#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Pomodoro Timer
# @raycast.mode silent
#
# Optional parameters:
# @raycast.packageName Pomodoro
# @raycast.icon clock
# @raycast.iconDark clock

# Only run on macOS where Raycast is available
if [ "$(uname)" = "Darwin" ]; then
  shortcuts run "Calm Notifications" -i "30m"
  open raycast://extensions/asubbotin/pomodoro/pomodoro-control-timer
else
  echo "This script is only available on macOS with Raycast"
  exit 1
fi
