#!/bin/bash

printf "$(($(cat /sys/class/backlight/intel_backlight/brightness)/75))"
