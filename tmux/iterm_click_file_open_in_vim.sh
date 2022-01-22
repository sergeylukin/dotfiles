#!/usr/bin/env bash

set -e

/usr/local/bin/tmux select-window -t vim
/usr/local/bin/tmux send-keys Escape
/usr/local/bin/tmux send-keys ":e +$2 $1"
/usr/local/bin/tmux send-keys Enter
/usr/local/bin/tmux send-keys zz
