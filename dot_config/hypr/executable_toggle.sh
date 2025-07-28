#!/bin/dash

program="$1"
shift 1
status=$(pgrep -x "$program") && {
    kill "$status"
    exit
}
"$program" $@
