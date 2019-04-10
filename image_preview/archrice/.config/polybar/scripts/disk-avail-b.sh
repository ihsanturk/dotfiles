#!/bin/zsh
printf "$(df -h 2>&1 >/dev/null | grep sdb1 | tr "  " " " | awk '{printf $4}')B"
