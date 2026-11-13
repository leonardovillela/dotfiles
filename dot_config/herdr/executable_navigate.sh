#!/bin/sh
# Vim-aware pane navigation, ported from is_vim in ~/.tmux.conf.local: send the
# key to (n)vim when it is in the foreground, otherwise move herdr's focus.
# Usage: navigate.sh <left|down|up|right> <key>

direction=$1
key=$2
herdr=${HERDR_BIN_PATH:-herdr}
pane=$HERDR_ACTIVE_PANE_ID

if "$herdr" pane process-info --pane "$pane" 2>/dev/null |
  jq -r '.result.process_info.foreground_processes[].name' |
  grep -iqE '^(\S+\/)?g?(view|n?vim?x?)(diff)?$'; then
  exec "$herdr" pane send-keys "$pane" "$key" >/dev/null
fi
exec "$herdr" pane focus --pane "$pane" --direction "$direction" >/dev/null
