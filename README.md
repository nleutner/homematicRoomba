homematicRoomba
===============

Roomba Implementierung in die homematic. Entsprechende Hardware vorausgesetzt.
http://www.roomba-wifi-remote.com/  WLAN-Modul
http://www.irobot.com/              Roomba

#Benötigte Addons
http://www.homematic-inside.de/software/item/cuxd
Gerät 28

#config.tcl
Hier muss die IP Adresse des Roomba eingetragen werden.

#clean.tcl
Aufruf im homematic Programm

dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicRoomba && tclsh clean.tcl");

#status.tcl
Systemvariabel:
Roomba-Batterie   Zahl

Aufruf im homematic Programm:

dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicRoomba && tclsh status.tcl");
