Roomba Implementierung in die homematic. Entsprechende Hardware vorausgesetzt.

http://www.roomba-wifi-remote.com/  WLAN-Modul
http://www.irobot.com/              Roomba


####Benötigte Addons:
#####CCU1:
[Telnet](http://www.homematic-inside.de/software/addons/item/telnet-dienst) -> mit Telnet ein Passwort für den FTP Zugang auf der CCU einrichten

Telnet Session (Windows) öffnen:

*   Start
*   Eingabeaufforderung
*   `telnet`
*   `open 192.168.X.X`
*   `root`
*   `passwd`
*   dein Passwort
*   dein Passwort

[FTP](http://www.homematic-inside.de/software/addons/item/ftp) -> Installieren

[Filezilla](https://filezilla-project.org/) -> Ordner aus dem GIT als Zip herunterladen und nach */usr/local/addons/* kopieren

*   Server:192.168.X.XXX
*   User:root
*   Passwort:dein Passwort was beim Telnet gesetzt wurde

#####CCU2:
[Filezilla](https://filezilla-project.org/) -> Ordner aus dem GIT als Zip herunterladen und nach */usr/local/addons/* kopieren

*   Server: sftp://192.168.X.XX
*   User:root
*   Passwort: MuZhlo9n%8!G
*   Port: 22

#####CCU1/CCU2

[CUx-Daemon](http://www.homematic-inside.de/software/cuxdaemon) -> Performance schonender Aufruf

*   homematic -> Einstellungen -> Systemsteuerung -> Zusatzsoftware
*   Cux-Damon -> Einstellen
*   Geräte
*   CUxD Gerätetyp -> (28)System)

![CuxD](https://github.com/nleutner/homematicWeather/blob/develop/addons/homematicWeather/doc/images/Cux%20Exec.jpg?raw=true)

*   homematic -> Posteingang

![homematic](https://raw.github.com/nleutner/homematicWeather/develop/addons/homematicWeather/doc/images/Cux%20CCU.gif)



###addons/homematicRoomba





####config.tcl
Hier muss die IP Adresse des Roomba eingetragen werden.

 Variabel                 |Beschreibung                                                                |
:-------------------------|:---------------------------------------------------------------------------|
ip                        |IP-Adresse des Roomba                                                       |




####clean.tcl
Diese Programm startet den Roomba, es wird Clean für 5 Sekunden gestartet, damit er Rückwärts rausfährt. Dnach bekommt er den Befehl sich umzudrehehn und in eine Richtung zu fahren. Der Weg muss angepasst werden.

#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
                          |             |      |

#####Aufruf im homematic Programm:
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicRoomba && tclsh clean.tcl");
```





####dock.tcl
Dieses Programm startet die Dock Funktion


#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
                          |             |      |

#####Aufruf im homematic Programm:
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicRoomba && tclsh dock.tcl");
```





####status.tcl
Dieses Programm errechnet den aktuellen Batteriestand in Prozent

#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Roomba-Batterie           |Zahl         |      |%

#####Aufruf im homematic Programm:
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicRoomba && tclsh clean.tcl");
```


