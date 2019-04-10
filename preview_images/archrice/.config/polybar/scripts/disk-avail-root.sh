#!/bin/zsh

printf "$(df -h 2>&1 >/dev/null | grep sda3 | tr "  " " " | awk '{printf $4}')B"
