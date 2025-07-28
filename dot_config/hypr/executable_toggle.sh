#!/bin/dash

program="$1"
shift 1
pid=$(pgrep -x "$program") && {
    kill "$pid"
    exit
}
"$program" $@
