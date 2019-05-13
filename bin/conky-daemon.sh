#!/bin/bash
# To install this script in Ubuntu:
# System > Preferences... > Startup Applications > |Add|
# Name: Conky Desktop Info
# Command: /home/inkarkat/bin/conky-daemon.sh
# Comment: Periodically updating desktop background with system and user information.

# Without a short delay, the user's Compiz configuration may not have been
# loaded yet, and a shadow may be drawn around the Conky window embedded in the
# desktop.
# Note: The same can be done by passing --pause 30 to conky.

exec > "/var/log/$USER/conky.log"; exec 2>&1

# Only start on the main display, not in VNC sessions.
if [ "$DISPLAY" != ':0' ]; then
    logf "Won't start on non-default display %s.\\n" "$DISPLAY"
    exit
fi

log "Starting Conky daemon soon..."
sleep 30

# When installed as above (on Ubuntu 14.04), the script is launched directly by
# lightdm > init, and my .profile hasn't been sourced. I like to use my custom
# functions (e.g. "callable"), so let's have them here.
[ -e ~/.profile ] && . ~/.profile

# A startup application does not have my full custom PATH, so set up a
# reasonable PATH here.
export PATH=$HOME/local/bin:$HOME/bin:$PATH

log "Starting Conky daemon now..."
/usr/bin/conky -d
