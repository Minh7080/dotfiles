#!/bin/dash

program="$1"
shift 1
pids=$(pgrep -x "$program") && {
    kill "$pids"
    exit
}
"$program" $@
