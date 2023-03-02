#!/bin/bash

exec > "/var/log/$USER/conky.log"; exec 2>&1

# Only start on the main display, not in VNC sessions.
if ! isOnDefaultDisplay; then
    logf "Won't start on non-default display %s.\\n" "$DISPLAY"
    exit
fi

# Without a short delay, the user's Compiz configuration may not have been
# loaded yet, and a shadow may be drawn around the Conky window embedded in the
# desktop.
# Note: The same can be done by passing --pause 30 to conky.
log "Starting Conky daemon soon..."
sleep 30

log "Starting Conky daemon now..."
/usr/bin/conky -d
