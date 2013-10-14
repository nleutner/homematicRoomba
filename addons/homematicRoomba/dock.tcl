#!/bin/tclsh

load tclrega.so;

# incluce system variable mapping
source conf/config.tcl

# Parameter für http://<IP>/rwr.cgi?exec=<Befehl>
# rwr.cgi?exec=h IDLE
# rwr.cgi?exec=j Sauger
# rwr.cgi?exec=k Dreher

# rwr.cgi?exec=a Vorwärts

# rwr.cgi?exec=1 IDLE
# rwr.cgi?exec=4 Clean
# rwr.cgi?exec=5 Spot
# rwr.cgi?exec=6 Dock

# rwr.cgi?exec=e 15 Grad Rechts
# rwr.cgi?exec=f 45 Grad Rechts
# rwr.cgi?exec=g 90 Grad Rechts

# rwr.cgi?exec=b 15 Grad Links
# rwr.cgi?exec=c 45 Grad Links
# rwr.cgi?exec=d 90 Grad links

source /usr/local/addons/homematicRoomba/lib/functions.tcl

#DriverMode
set url http://$ip/rwr.cgi?exec=h
exec wget -O /dev/null -q $url

sleep 2000

#Dock
set url http://$ip/rwr.cgi?exec=6
exec wget -O /dev/null -q $url

exit 0;