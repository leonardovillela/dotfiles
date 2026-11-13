#!/bin/sh
# Tab bar items for herdr's ui.tab_bar_right, ported from the tmux status-right in
# ~/.tmux.conf.local (tmux-cpu, tmux-online-status, oh-my-tmux uptime).
# herdr strips colors, so >= 90% gets a warning icon instead of tmux's red background.
# Usage: status.sh <cpu|ram|online|host|uptime>

high() {
  awk -v pct="${1%\%}" 'BEGIN { exit !(pct >= 90) }' && printf ' '
}

sum_macos_vm_stats() {
  grep -Eo '[0-9]+' |
    awk '{ a += $1 * 4096 } END { print a }'
}

case $1 in
cpu)
  pct=$(iostat -c 2 disk0 | sed '/^\s*$/d' | tail -n 1 | awk '{usage=100-$6} END {printf("%3.1f%%", usage)}' | sed 's/,/./')
  echo " $pct$(high "$pct")"
  ;;
ram)
  stats="$(vm_stat)"
  used_and_cached=$(echo "$stats" | grep -E "(Pages active|Pages inactive|Pages speculative|Pages wired down|Pages occupied by compressor)" | sum_macos_vm_stats)
  cached=$(echo "$stats" | grep -E "(Pages purgeable|File-backed pages)" | sum_macos_vm_stats)
  free=$(echo "$stats" | grep -E "(Pages free)" | sum_macos_vm_stats)
  used=$((used_and_cached - cached))
  total=$((used_and_cached + free))
  pct=$(echo "$used $total" | awk '{printf("%3.1f%%", 100*$1/$2)}')
  echo " $pct$(high "$pct")"
  ;;
online)
  if ping -c 1 -t 3 www.google.com >/dev/null 2>&1; then
    echo "󰖩 on"
  else
    echo "󰖪 off"
  fi
  ;;
host)
  echo " $(hostname -s)"
  ;;
uptime)
  boot=$(sysctl -n kern.boottime 2>/dev/null)
  boot=${boot#*sec = }
  boot=${boot%%,*}
  uptime=$(($(date +%s) - boot))
  echo " $((uptime / 86400))d $(((uptime / 3600) % 24))h"
  ;;
esac
