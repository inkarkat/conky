#!/bin/sh
# To install this script in Ubuntu:
# System > Preferences... > Startup Applications > |Add|
# Name: Conky Desktop Info
# Command: /home/inkarkat/bin/conky-daemon.sh
# Comment: Periodically updating desktop background with system and user information.

# Without a short delay, the user's Compiz configuration may not have been
# loaded yet, and a shadow may be drawn around the Conky window embedded in the
# desktop.
# Note: The same can be done by passing --pause 30 to conky.
echo "Starting Conky daemon soon..." > /var/log/conky.log
sleep 30

# A startup application does not have my full custom PATH, so set up a
# reasonable PATH here.
export PATH=$HOME/local/bin:$HOME/bin:$PATH

/usr/bin/conky -d >> /var/log/conky.log 2>&1
