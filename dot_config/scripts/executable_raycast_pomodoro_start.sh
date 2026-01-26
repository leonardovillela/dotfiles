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

shortcuts run "Calm Notifications" -i "30m"
open raycast://extensions/asubbotin/pomodoro/pomodoro-control-timer
