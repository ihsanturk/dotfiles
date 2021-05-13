#!/bin/sh

PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTCONTROL=ignoreboth
shopt -s histappend
